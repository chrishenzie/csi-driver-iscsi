# Copyright 2021 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#! /bin/bash -x

# Update initiatorname with ${iSCSI_INITIATOR_NAME} and start iscsid, if it is defined
if [ -n "${iSCSI_INITIATOR_NAME}" ]; then
	echo "InitiatorName=${iSCSI_INITIATOR_NAME}" > /etc/iscsi/initiatorname.iscsi 
	# Start iscsid
	iscsid -f &
fi

# Start iscsiplugin
./iscsiplugin $*
