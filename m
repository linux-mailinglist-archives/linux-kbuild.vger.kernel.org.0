Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C450A35DFC9
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Apr 2021 15:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbhDMNLw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Apr 2021 09:11:52 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37826 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231486AbhDMNLv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Apr 2021 09:11:51 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13DD328w032076;
        Tue, 13 Apr 2021 09:11:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qw/B9esAJ26jq7yxahNr8Pmb2V3EmQElYpeUAyWSuCo=;
 b=HzNtnzYy5WdPgZzfCfgGMdiEiAE7AnkmlcPb9WxVvB3nyK3ITopeJKNxKSU2LWEwicfF
 DAPcudq0xmDrulrjNuBuRqbqalHr0N88iDc8CfHGfU3AR50uDCiAMLCm0/RdDg8i08zj
 bo4J2DmILy8JlM5yiq6SfL7MW+1u6rCxHbgWSFIxi9jVx42VjJOiVFeKwcEoJkp+uGNU
 Y5t7fGsdyC2u4Eb/eJuxkIP0SExrU0wA0bUvofJhMBo6k7Gz0OcJAIoQd4ALE6/DGvxD
 nvRohljN/klNJW3rMDAwFqKpcP9NlkVBvSfAELRBqW4MxCFWVFHtJlMzU5o5w5b6xYUI Hg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0b-001b2d01.pphosted.com with ESMTP id 37vtvyfwxh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Apr 2021 09:11:27 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DD2l8l016028;
        Tue, 13 Apr 2021 13:11:25 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma04fra.de.ibm.com with ESMTP id 37u3n89dt2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Apr 2021 13:11:25 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13DDB0jl27591162
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Apr 2021 13:11:00 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 645AF11C06C;
        Tue, 13 Apr 2021 13:11:22 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0B79811C052;
        Tue, 13 Apr 2021 13:11:22 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.28.118])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue, 13 Apr 2021 13:11:21 +0000 (GMT)
Subject: Re: [PATCH 3/4] kbuild: spilt cc-option and friends to
 scripts/Makefile.compiler
To:     Janosch Frank <frankja@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Marc Hartmayer <mhartmay@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>
References: <20210228061028.239459-1-masahiroy@kernel.org>
 <20210228061028.239459-3-masahiroy@kernel.org>
 <86dadf33-70f7-a5ac-cb8c-64966d2f45a1@linux.ibm.com>
From:   Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <395d2db1-b860-0da2-a859-d1d840508a46@de.ibm.com>
Date:   Tue, 13 Apr 2021 15:11:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <86dadf33-70f7-a5ac-cb8c-64966d2f45a1@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JmFjsGkHnMSCqLBVrV6rsv5U0Cg1SgUv
X-Proofpoint-GUID: JmFjsGkHnMSCqLBVrV6rsv5U0Cg1SgUv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-13_07:2021-04-13,2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104130091
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 13.04.21 14:51, Janosch Frank wrote:
> On 2/28/21 7:10 AM, Masahiro Yamada wrote:
>> scripts/Kbuild.include is included everywhere, but macros such as
>> cc-option are needed by build targets only.
>>
>> For example, when 'make clean' traverses the tree, it does not need
>> to evaluate $(call cc-option,).
>>
>> Split cc-option, ld-option, etc. to scripts/Makefile.compiler, which
>> is only included from the top Makefile and scripts/Makefile.build.
>>
>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> 
> This commit broke the KVM selftest compilation under s390 in linux-next
> for me. Funny enough the compilation is only broken on Ubuntu, under
> Fedora the test fails with an assertion.
> 
> FEDORA:
> [root@fedora kvm]# ./set_memory_region_test
> Allowed number of memory slots: 32767
> ==== Test Assertion Failure ====
>    lib/kvm_util.c:142: vm->fd >= 0
>    pid=1541645 tid=1541645 - Invalid argument
>       1	0x0000000001002f4b: vm_open at kvm_util.c:142
>       2	 (inlined by) vm_create at kvm_util.c:258
>       3	0x00000000010015ef: test_add_max_memory_regions at
> set_memory_region_test.c:351
>       4	 (inlined by) main at set_memory_region_test.c:397
>       5	0x000003ffa3d2bb89: ?? ??:0
>       6	0x00000000010017ad: .annobin_abi_note.c.hot at crt1.o:?
>    KVM_CREATE_VM ioctl failed, rc: -1 errno: 22
> 
> 
> Ubuntu:
> make[1]: Leaving directory '/mnt/dev/linux'
> gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99
> -fno-stack-protector -fno-PIE -I../../../../tools/include
> -I../../../../tools/arch/s390/include -I../../../../usr/include/
> -Iinclude -Ilib -Iinclude/s390x -I..   -c lib/sparsebit.c -o
> /mnt/dev/linux/tools/testing/selftests/kvm/lib/sparsebit.o
> gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99
> -fno-stack-protector -fno-PIE -I../../../../tools/include
> -I../../../../tools/arch/s390/include -I../../../../usr/include/
> -Iinclude -Ilib -Iinclude/s390x -I..   -c lib/kvm_util.c -o
> /mnt/dev/linux/tools/testing/selftests/kvm/lib/kvm_util.o
> gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99
> -fno-stack-protector -fno-PIE -I../../../../tools/include
> -I../../../../tools/arch/s390/include -I../../../../usr/include/
> -Iinclude -Ilib/s390x -Iinclude/s390x -I..   -c
> lib/s390x/diag318_test_handler.c -o
> /mnt/dev/linux/tools/testing/selftests/kvm/lib/s390x/diag318_test_handler.o
> ar crs /mnt/dev/linux/tools/testing/selftests/kvm/libkvm.a
> /mnt/dev/linux/tools/testing/selftests/kvm/lib/assert.o
> /mnt/dev/linux/tools/testing/selftests/kvm/lib/elf.o
> /mnt/dev/linux/tools/testing/selftests/kvm/lib/io.o
> /mnt/dev/linux/tools/testing/selftests/kvm/lib/kvm_util.o
> /mnt/dev/linux/tools/testing/selftests/kvm/lib/sparsebit.o
> /mnt/dev/linux/tools/testing/selftests/kvm/lib/test_util.o
> /mnt/dev/linux/tools/testing/selftests/kvm/lib/guest_modes.o
> /mnt/dev/linux/tools/testing/selftests/kvm/lib/perf_test_util.o
> /mnt/dev/linux/tools/testing/selftests/kvm/lib/s390x/processor.o
> /mnt/dev/linux/tools/testing/selftests/kvm/lib/s390x/ucall.o
> /mnt/dev/linux/tools/testing/selftests/kvm/lib/s390x/diag318_test_handler.o
> gcc -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99
> -fno-stack-protector -fno-PIE -I../../../../tools/include
> -I../../../../tools/arch/s390/include -I../../../../usr/include/
> -Iinclude -Is390x -Iinclude/s390x -I..  -pthread    s390x/memop.c
> /mnt/dev/linux/tools/testing/selftests/kvm/libkvm.a  -o
> /mnt/dev/linux/tools/testing/selftests/kvm/s390x/memop
> /usr/bin/ld: /tmp/ccFU8WYF.o: `stdout@@GLIBC_2.2' non-PLT reloc for
> symbol defined in shared library and accessed from executable (rebuild
> file with -fPIC ?)
> /usr/bin/ld: final link failed: bad value
> collect2: error: ld returned 1 exit status
> make: *** [../lib.mk:139:
> /mnt/dev/linux/tools/testing/selftests/kvm/s390x/memop] Error 1
> 



It looks like that from tools/testing/selftests/kvm/Makefile
additional linker flags are being ignored with this patch.

no-pie-option := $(call try-run, echo 'int main() { return 0; }' | \
         $(CC) -Werror -no-pie -x c - -o "$$TMP", -no-pie)

# On s390, build the testcases KVM-enabled
pgste-option = $(call try-run, echo 'int main() { return 0; }' | \
         $(CC) -Werror -Wl$(comma)--s390-pgste -x c - -o "$$TMP",-Wl$(comma)--s390-pgste)


LDFLAGS += -pthread $(no-pie-option) $(pgste-option)

