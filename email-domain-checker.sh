#!/bin/sh

# Copyright 2016 Rob Jordan - Blazedog Computer Consulting
#                http://www.blazedog.com

# This software is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this software. If not, see http://www.gnu.org/licenses/.


for i in `cat email.txt`
do
	host=`echo $i | awk -- 'BEGIN {FS="@"} {print $2}'`
	host $host | grep -q "mail is handled by" 
	if [ $? -ne 0 ]
		then
		echo "$i dead"
	else
		echo "$i live"
	fi
done