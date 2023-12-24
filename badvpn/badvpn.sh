#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY��8�  �_�1p���?c߮����@   PZ^VlhdT����Ѡѣ�Ѡ� �4��� Қ��4��       ���=&���S��2bh z�&���42i��F��FF�@bhɠ��H�CI��&Cjj2zM6��COP �12D�2=T�C�8�!0d8H���R"ABUUUUc#�Ƙ"�A!�������B��lXmn߆	82N@j>B^8�/���vb/s��؎v��ԥX*�UP�01�4��3�-�*�6đZ̭��h�d"���=�3 ��ΞƆT�aj�;���{x|�"h4��)������'4I�y�I2�4�gG9�x6�^Y](UU�t#����I$�#�\H��6�\+�z*'�:�O�+9�9���#��w�d��̲ ���ۊ- ��떃�E�Z\�D�5�>����jM5���{��q�ג�;�$��w�{ܦM��&ق\���Y��qGv�#�b���]��B���I$�o�`7�� �N��z����H�=��00��k��ֈ�&QCt��XF����/�M]PC�$�8#&�L�x�������A�`YbV��n��4��a�W�d9)!��s�IC��B&����Y�J�TD�AY���2�gK1�HNV�N���3�����k�q��ˬ�'�G	��X���\0�Ҫ5��k���S��Vb{-چ�m���m��#��L
�%aN�gѰ��k,�D%��1�(�M;���6VW�(Ns8ֹ�:#cf�ۅ:Lۀ�ֵjtE&��Ĳ�����(p&�D~�L��z�'}�A���%2��1�Wq	&EV\dM\�݄H�|�����8I<�rd"Dհ!0��R��Jܱ�92�ծ�W
���E����H��̱	-��DzaB 8�$ &��(�@"�"���ܑN$=�N5�