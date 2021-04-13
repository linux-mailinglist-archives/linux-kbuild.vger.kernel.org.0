Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D881035DF6F
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Apr 2021 14:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237085AbhDMMwI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Apr 2021 08:52:08 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63392 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S244817AbhDMMwA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Apr 2021 08:52:00 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13DCXuMj070877;
        Tue, 13 Apr 2021 08:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=to : cc : references :
 from : subject : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7uwIiPvlBt4zo1jfnp6M/26Tg9kARnIyqG4TyzUIqrs=;
 b=QyagiB9ZTKM/dqr5f4tPeqk1FtpCkPr8xeHcUkH9zNMOefN21nghll6MLiilT8rY751e
 CmFy2WzKVXDKcDaLIsETOz8a73tEdWyEio0VtSczw0NwTU67B8ny5KC1R0zINmVnntJo
 lXoYVYXlHskNVlKxPPHg+mBtbaf1fPjyENj0bshIYerp33spuKld1LUVyMoEz0QGCKW3
 TiV3BGvVcKSadzc9BrYmBrAO1/zULSkeMXHW6LmRvTVz1jzT6Bu9FbBRXD3fbKfsRPai
 /NtmifkHU8qdLoBYxc7+qUZHaKg710NMlzdi97txDqlnCxkexlj/xAbZ+FSSwiBYJMKw nw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
        by mx0b-001b2d01.pphosted.com with ESMTP id 37w7sd73a7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Apr 2021 08:51:37 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
        by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DCX36Q013704;
        Tue, 13 Apr 2021 12:51:35 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma06ams.nl.ibm.com with ESMTP id 37u39hjpfb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Apr 2021 12:51:35 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13DCpAHc32637272
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Apr 2021 12:51:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 702C94C050;
        Tue, 13 Apr 2021 12:51:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EBC984C040;
        Tue, 13 Apr 2021 12:51:31 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.149.46])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue, 13 Apr 2021 12:51:31 +0000 (GMT)
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Marc Hartmayer <mhartmay@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>
References: <20210228061028.239459-1-masahiroy@kernel.org>
 <20210228061028.239459-3-masahiroy@kernel.org>
From:   Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH 3/4] kbuild: spilt cc-option and friends to
 scripts/Makefile.compiler
Message-ID: <86dadf33-70f7-a5ac-cb8c-64966d2f45a1@linux.ibm.com>
Date:   Tue, 13 Apr 2021 14:51:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210228061028.239459-3-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: i-v6nS80wVWVJJuKyEyhkgSIpMzbdzNR
X-Proofpoint-GUID: i-v6nS80wVWVJJuKyEyhkgSIpMzbdzNR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-13_07:2021-04-13,2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130086
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2/28/21 7:10 AM, Masahiro Yamada wrote:
> scripts/Kbuild.include is included everywhere, but macros such as
> cc-option are needed by build targets only.
> 
> For example, when 'make clean' traverses the tree, it does not need
> to evaluate $(call cc-option,).
> 
> Split cc-option, ld-option, etc. to scripts/Makefile.compiler, which
> is only included from the top Makefile and scripts/Makefile.build.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

This commit broke the KVM selftest compilation under s390 in linux-next
for me. Funny enough the compilation is only broken on Ubuntu, under
Fedora the test fails with an assertion.

FEDORA:
[root@fedora kvm]# ./set_memory_region_test
Allowed number of memory slots: 32767
==== Test Assertion Failure ====
  lib/kvm_util.c:142: vm->fd >= 0
  pid=1541645 tid=1541645 - Invalid argument
     1	0x0000000001002f4b: vm_open at kvm_util.c:142
     2	 (inlined by) vm_create at kvm_util.c:258
     3	0x00000000010015ef: test_add_max_memory_regions at
set_memory_region_test.c:351
     4	 (inlined by) main at set_memory_region_test.c:397
     5	0x000003ffa3d2bb89: ?? ??:0
     6	0x00000000010017ad: .annobin_abi_note.c.hot at crt1.o:?
  KVM_CREATE_VM ioctl failed, rc: -1 errno: 22


Ubuntu:
make[1]: Leaving directory '/mnt/dev/linux'
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99
-fno-stack-protector -fno-PIE -I../../../../tools/include
-I../../../../tools/arch/s390/include -I../../../../usr/include/
-Iinclude -Ilib -Iinclude/s390x -I..   -c lib/sparsebit.c -o
/mnt/dev/linux/tools/testing/selftests/kvm/lib/sparsebit.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99
-fno-stack-protector -fno-PIE -I../../../../tools/include
-I../../../../tools/arch/s390/include -I../../../../usr/include/
-Iinclude -Ilib -Iinclude/s390x -I..   -c lib/kvm_util.c -o
/mnt/dev/linux/tools/testing/selftests/kvm/lib/kvm_util.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99
-fno-stack-protector -fno-PIE -I../../../../tools/include
-I../../../../tools/arch/s390/include -I../../../../usr/include/
-Iinclude -Ilib/s390x -Iinclude/s390x -I..   -c
lib/s390x/diag318_test_handler.c -o
/mnt/dev/linux/tools/testing/selftests/kvm/lib/s390x/diag318_test_handler.o
ar crs /mnt/dev/linux/tools/testing/selftests/kvm/libkvm.a
/mnt/dev/linux/tools/testing/selftests/kvm/lib/assert.o
/mnt/dev/linux/tools/testing/selftests/kvm/lib/elf.o
/mnt/dev/linux/tools/testing/selftests/kvm/lib/io.o
/mnt/dev/linux/tools/testing/selftests/kvm/lib/kvm_util.o
/mnt/dev/linux/tools/testing/selftests/kvm/lib/sparsebit.o
/mnt/dev/linux/tools/testing/selftests/kvm/lib/test_util.o
/mnt/dev/linux/tools/testing/selftests/kvm/lib/guest_modes.o
/mnt/dev/linux/tools/testing/selftests/kvm/lib/perf_test_util.o
/mnt/dev/linux/tools/testing/selftests/kvm/lib/s390x/processor.o
/mnt/dev/linux/tools/testing/selftests/kvm/lib/s390x/ucall.o
/mnt/dev/linux/tools/testing/selftests/kvm/lib/s390x/diag318_test_handler.o
gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99
-fno-stack-protector -fno-PIE -I../../../../tools/include
-I../../../../tools/arch/s390/include -I../../../../usr/include/
-Iinclude -Is390x -Iinclude/s390x -I..  -pthread    s390x/memop.c
/mnt/dev/linux/tools/testing/selftests/kvm/libkvm.a  -o
/mnt/dev/linux/tools/testing/selftests/kvm/s390x/memop
/usr/bin/ld: /tmp/ccFU8WYF.o: `stdout@@GLIBC_2.2' non-PLT reloc for
symbol defined in shared library and accessed from executable (rebuild
file with -fPIC ?)
/usr/bin/ld: final link failed: bad value
collect2: error: ld returned 1 exit status
make: *** [../lib.mk:139:
/mnt/dev/linux/tools/testing/selftests/kvm/s390x/memop] Error 1

> ---
> 
>  Makefile                  |  4 ++
>  scripts/Kbuild.include    | 80 ---------------------------------------
>  scripts/Makefile.build    |  1 +
>  scripts/Makefile.compiler | 77 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 82 insertions(+), 80 deletions(-)
>  create mode 100644 scripts/Makefile.compiler
> 
> diff --git a/Makefile b/Makefile
> index 2253e31a6bcf..eec7a94f5c33 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -582,6 +582,10 @@ KBUILD_AFLAGS	+= $(CLANG_FLAGS)
>  export CLANG_FLAGS
>  endif
> 
> +# Include this also for config targets because some architectures need
> +# cc-cross-prefix to determine CROSS_COMPILE.
> +include $(srctree)/scripts/Makefile.compiler
> +
>  ifdef config-build
>  # ===========================================================================
>  # *config targets only - make sure prerequisites are updated, and descend
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 509e0856d653..82dd1b65b7a8 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -67,86 +67,6 @@ define filechk
>  	fi
>  endef
> 
> -######
> -# gcc support functions
> -# See documentation in Documentation/kbuild/makefiles.rst
> -
> -# cc-cross-prefix
> -# Usage: CROSS_COMPILE := $(call cc-cross-prefix, m68k-linux-gnu- m68k-linux-)
> -# Return first <prefix> where a <prefix>gcc is found in PATH.
> -# If no gcc found in PATH with listed prefixes return nothing
> -#
> -# Note: '2>/dev/null' is here to force Make to invoke a shell. Otherwise, it
> -# would try to directly execute the shell builtin 'command'. This workaround
> -# should be kept for a long time since this issue was fixed only after the
> -# GNU Make 4.2.1 release.
> -cc-cross-prefix = $(firstword $(foreach c, $(1), \
> -			$(if $(shell command -v -- $(c)gcc 2>/dev/null), $(c))))
> -
> -# output directory for tests below
> -TMPOUT = $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/).tmp_$$$$
> -
> -# try-run
> -# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
> -# Exit code chooses option. "$$TMP" serves as a temporary file and is
> -# automatically cleaned up.
> -try-run = $(shell set -e;		\
> -	TMP=$(TMPOUT)/tmp;		\
> -	TMPO=$(TMPOUT)/tmp.o;		\
> -	mkdir -p $(TMPOUT);		\
> -	trap "rm -rf $(TMPOUT)" EXIT;	\
> -	if ($(1)) >/dev/null 2>&1;	\
> -	then echo "$(2)";		\
> -	else echo "$(3)";		\
> -	fi)
> -
> -# as-option
> -# Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
> -
> -as-option = $(call try-run,\
> -	$(CC) $(KBUILD_CFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
> -
> -# as-instr
> -# Usage: cflags-y += $(call as-instr,instr,option1,option2)
> -
> -as-instr = $(call try-run,\
> -	printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
> -
> -# __cc-option
> -# Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
> -__cc-option = $(call try-run,\
> -	$(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
> -
> -# cc-option
> -# Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
> -
> -cc-option = $(call __cc-option, $(CC),\
> -	$(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS),$(1),$(2))
> -
> -# cc-option-yn
> -# Usage: flag := $(call cc-option-yn,-march=winchip-c6)
> -cc-option-yn = $(call try-run,\
> -	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",y,n)
> -
> -# cc-disable-warning
> -# Usage: cflags-y += $(call cc-disable-warning,unused-but-set-variable)
> -cc-disable-warning = $(call try-run,\
> -	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
> -
> -# cc-ifversion
> -# Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
> -cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
> -
> -# ld-option
> -# Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
> -ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
> -
> -# ld-ifversion
> -# Usage:  $(call ld-ifversion, -ge, 22252, y)
> -ld-ifversion = $(shell [ $(CONFIG_LD_VERSION)0 $(1) $(2)0 ] && echo $(3) || echo $(4))
> -
> -######
> -
>  ###
>  # Shorthand for $(Q)$(MAKE) -f scripts/Makefile.build obj=
>  # Usage:
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 750d6d5225af..d74d3383666e 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -36,6 +36,7 @@ subdir-ccflags-y :=
>  -include include/config/auto.conf
> 
>  include $(srctree)/scripts/Kbuild.include
> +include $(srctree)/scripts/Makefile.compiler
> 
>  # The filename Kbuild has precedence over Makefile
>  kbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> new file mode 100644
> index 000000000000..5f759ecc4f04
> --- /dev/null
> +++ b/scripts/Makefile.compiler
> @@ -0,0 +1,77 @@
> +######
> +# gcc support functions
> +# See documentation in Documentation/kbuild/makefiles.rst
> +
> +# cc-cross-prefix
> +# Usage: CROSS_COMPILE := $(call cc-cross-prefix, m68k-linux-gnu- m68k-linux-)
> +# Return first <prefix> where a <prefix>gcc is found in PATH.
> +# If no gcc found in PATH with listed prefixes return nothing
> +#
> +# Note: '2>/dev/null' is here to force Make to invoke a shell. Otherwise, it
> +# would try to directly execute the shell builtin 'command'. This workaround
> +# should be kept for a long time since this issue was fixed only after the
> +# GNU Make 4.2.1 release.
> +cc-cross-prefix = $(firstword $(foreach c, $(1), \
> +			$(if $(shell command -v -- $(c)gcc 2>/dev/null), $(c))))
> +
> +# output directory for tests below
> +TMPOUT = $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/).tmp_$$$$
> +
> +# try-run
> +# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
> +# Exit code chooses option. "$$TMP" serves as a temporary file and is
> +# automatically cleaned up.
> +try-run = $(shell set -e;		\
> +	TMP=$(TMPOUT)/tmp;		\
> +	TMPO=$(TMPOUT)/tmp.o;		\
> +	mkdir -p $(TMPOUT);		\
> +	trap "rm -rf $(TMPOUT)" EXIT;	\
> +	if ($(1)) >/dev/null 2>&1;	\
> +	then echo "$(2)";		\
> +	else echo "$(3)";		\
> +	fi)
> +
> +# as-option
> +# Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
> +
> +as-option = $(call try-run,\
> +	$(CC) $(KBUILD_CFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
> +
> +# as-instr
> +# Usage: cflags-y += $(call as-instr,instr,option1,option2)
> +
> +as-instr = $(call try-run,\
> +	printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
> +
> +# __cc-option
> +# Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
> +__cc-option = $(call try-run,\
> +	$(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
> +
> +# cc-option
> +# Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
> +
> +cc-option = $(call __cc-option, $(CC),\
> +	$(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS),$(1),$(2))
> +
> +# cc-option-yn
> +# Usage: flag := $(call cc-option-yn,-march=winchip-c6)
> +cc-option-yn = $(call try-run,\
> +	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",y,n)
> +
> +# cc-disable-warning
> +# Usage: cflags-y += $(call cc-disable-warning,unused-but-set-variable)
> +cc-disable-warning = $(call try-run,\
> +	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
> +
> +# cc-ifversion
> +# Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
> +cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
> +
> +# ld-option
> +# Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
> +ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
> +
> +# ld-ifversion
> +# Usage:  $(call ld-ifversion, -ge, 22252, y)
> +ld-ifversion = $(shell [ $(CONFIG_LD_VERSION)0 $(1) $(2)0 ] && echo $(3) || echo $(4))
> 

