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
BZh91AY&SYd7ӧ  J_� }��?�ފ?���@�vҚ�!))����2dd�  �sLL & & 0 �FFTg�=M3I�=&�   z�JLA3S
M�zI�=A�M��G�ɵ2���^�,���JXL4pt�P���Ti~v-�WE����1IC�����*���e[r��||�T��8��mOs�J��zRPʷ����7����en��ElG��Rx�3�fny�yӔ�f�+c`�c�@2q��-�6��4o2���
I*�?��#�����7��y�Fr`����N<�<�M`�$7�o.�i�sz�b�g�T&�D��e�C�`��8"/{B���|��3�0�%���f�3*˜=�I��c�|G���L8�=�K�Ԕ� �{R�r#�V�9���XФ<Į����!��d��Qy5�k>����[�J'8�Vbwa)X���ĵQ����-�f�j���m���LF&I��nQ�8��P��d9:M� I>;"�핔x�&�)�D�iA�/bH�NRFNFVE��+q�F�9ACQ��#2�b���H�����*--�TnR��TL1$��S()�$8�P+Fȶ�Q�(U�I��E�RI�7
�©��̙
K�Q��HLh4��ȁ1��NX�5����)�!��8