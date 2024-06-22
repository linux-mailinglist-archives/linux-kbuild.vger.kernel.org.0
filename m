Return-Path: <linux-kbuild+bounces-2238-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF2F9136BC
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Jun 2024 00:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C50541F22507
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Jun 2024 22:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE7A7604D;
	Sat, 22 Jun 2024 22:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YErgtmeZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA79D524;
	Sat, 22 Jun 2024 22:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719096511; cv=none; b=dD4dFsSGJsq+1YfJPoIaY9txQCeLDhaqyiC3vOo68ENnoFXXbJLnKtz/T+pCJR0QK6wFnxC+mOhyyNKKYc4X5R5ldoAqCb6uQl97b+sraC50NSbGcHnQcKGMe92Dw9USJJ10/HUBD9h3ycZ2E/nfR1L5PUWirufVg++isAfNTbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719096511; c=relaxed/simple;
	bh=Vpc/N0k3jLg85KcBr0aM55ns6eCSGJ3EhC3Qwqce96I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5sdTdZ0iwB2CYRAB2T3z+M01i/Zin+L2FMNPtgeLuVMXF2mPEe/BeFid5qBuTANJMyOlx1y6JBQY843pcSRKErNLu4As+XYFF7ZRVwQ7QYs3ZhK51CrF7/qbo0t1XWbdgvBw3gTN0c/1W0k944wfR83jIGWLrTlZu6oSdtxQX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YErgtmeZ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6f8ebbd268so696557066b.0;
        Sat, 22 Jun 2024 15:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719096504; x=1719701304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQGT3EL6CExD6Kwfkiwdke65L4qR9yJBgCh8JATI/VI=;
        b=YErgtmeZY6QeR9H9h1hOZ8eFY0rlqp+LeN3Z2RhvO6iFEiGiflRW+OWENGYsWLg/Z9
         xY7DQ96923qDZoD0fRS2TGUgL8x7ZnTqNiHZsYORrqt8D0PQRfAWuMZiEOtFPaFtty5/
         /Hnn+wZO6qBcCkKRVL5OTf8108XB6cF381HyJ/lEVn9PLRosowhfqWksq9kvCBtL4g6x
         iZLixhYDB81dV8srOIILGy1Z3nszBfmAsZ+KKow3Beg/vjbgDHyE80R6rbzUUveE/JW8
         J46M48HZjaojTl1wMw3bKn0XaStPA/y/sWVy7iRvDSmwxDFTDDQQMbkCWiVuY7yB0cks
         3u1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719096504; x=1719701304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQGT3EL6CExD6Kwfkiwdke65L4qR9yJBgCh8JATI/VI=;
        b=Gk14okzs9sQ7YhodVQcLeXdqgK0AmC5Xt8SXNOzV/B+/nOGbAxr4UNaSKEB+kYT6z0
         KC2M7q9uppHvF6qoeP2JbGjk40hSWqZagW1JkRTmijZrcSWb2mGLpe7js5rj43eZEh97
         f06Bq/7daXHzZ/qb8u5DEOMJwK9hFqD5l/TX9MlIH4TiorWdMknPvzfXsO3pVZkEOWX+
         qwVjF/e/EBZ2MMHO7aEgZuE1b5Y9NjWJpoVPGLEdAToO/E1iHhl9NKm88XsmJadCp0B2
         6ZUAtpnTPORoorIlf4or4UnaKFoRy6dqPq9bXRwUEXkH3wD6972O0LwAb96l1Ia4pycR
         LIXw==
X-Forwarded-Encrypted: i=1; AJvYcCUWEGUvlyelbnBNF+flBMggZgw2G7Iy55CdUEmhWlBBZbB3Nle+uxhwL65uR5Rco4Utn59mZYNz5nfDACKrEpuu8r48O34anrDLnxHv5LzmUHzdNZYt/CwkzXusQrCfoBCwm1yFsj0yyZV/3ANoojH4wu3e/BZifjTKh6EqxzkA18jfLQc3
X-Gm-Message-State: AOJu0YyfFym/dq4m3vtb3g4YSU5lNQxrZdNaTXHlt/fM9Wn7wOkHNwxW
	Jjzrua4ryu8uD3cjmRlW8TeVJbS9XctKd//6zlnHT2Cg+8QMQKPD
X-Google-Smtp-Source: AGHT+IGYBWFlDDR67YW48t0ychZ0n4n+XRG27LO2po5I/7QCqxAtb18OF3WCJawD7N7OrJn3gJtBtg==
X-Received: by 2002:a17:906:ae48:b0:a62:e450:b147 with SMTP id a640c23a62f3a-a700e707051mr148055366b.29.1719096502527;
        Sat, 22 Jun 2024 15:48:22 -0700 (PDT)
Received: from [192.168.178.20] (dh207-43-156.xnet.hr. [88.207.43.156])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30534e2asm2838971a12.70.2024.06.22.15.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 15:48:21 -0700 (PDT)
Message-ID: <6cdb1346-75ca-472e-8d96-d58a1eaab172@gmail.com>
Date: Sun, 23 Jun 2024 00:48:20 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PROBLEM] make randconfig: net/netfilter/core.c:830: undefined
 reference to `netfilter_lwtunnel_fini'
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org
References: <7a472130-d9c4-4fda-840b-093308f73d3d@gmail.com>
 <Znc4931wlIgvqrfP@calendula>
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
In-Reply-To: <Znc4931wlIgvqrfP@calendula>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/24 22:49, Pablo Neira Ayuso wrote:
> Hi,
> 
> There is a fix on the table address this, I will submit is in the next
> pull request.

Thank you very much.

Please consider adding Reported-by: Mirsad Todorovac <mtodorovac69@gmail.com>
 
> Thanks for reporting

No big deal. Anytime :-)

Best regards,
Mirsad

> On Sat, Jun 22, 2024 at 09:53:38PM +0200, Mirsad Todorovac wrote:
>> Hi all,
>>
>> According to the recommendation in https://lore.kernel.org/lkml/20240404134142.GCZg6uFh_ZSzUFLChd@fat_crate.local/
>> I tried a couple of "make randconfig" .configs.
>>
>> The second one I tried today had some problems in compilation:
>>
>>
>> marvin@defiant:~/linux/kernel/linux_torvalds$ time nice make -j 36 bindeb-pkg |& tee ../err-6.10-rc4-allyes-01.log; date
>>   GEN     debian
>> dpkg-buildpackage --build=binary --no-pre-clean --unsigned-changes -R'make -f debian/rules' -j1 -a$(cat debian/arch)
>> dpkg-buildpackage: info: source package linux-upstream
>> dpkg-buildpackage: info: source version 6.10.0-rc4-00283-g563a50672d8a-6
>> dpkg-buildpackage: info: source distribution jammy
>> dpkg-buildpackage: info: source changed by marvin <marvin@defiant>
>>  dpkg-source --before-build .
>> dpkg-buildpackage: info: host architecture amd64
>>  make -f debian/rules binary
>> #
>> # No change to .config
>> #
>> mkdir -p /home/marvin/linux/kernel/linux_torvalds/tools/objtool && make O=/home/marvin/linux/kernel/linux_torvalds subdir=tools/objtool --no-print-directory -C objtool 
>> mkdir -p /home/marvin/linux/kernel/linux_torvalds/tools/bpf/resolve_btfids && make O=/home/marvin/linux/kernel/linux_torvalds subdir=tools/bpf/resolve_btfids --no-print-directory -C bpf/resolve_btfids 
>>   INSTALL libsubcmd_headers
>>   INSTALL libsubcmd_headers
>>   CALL    scripts/checksyscalls.sh
>>   UPD     init/utsversion-tmp.h
>>   CC      init/version.o
>>   AR      init/built-in.a
>>   CHK     kernel/kheaders_data.tar.xz
>>   AR      built-in.a
>>   AR      vmlinux.a
>>   LD      vmlinux.o
>>   OBJCOPY modules.builtin.modinfo
>>   GEN     modules.builtin
>>   MODPOST vmlinux.symvers
>>   UPD     include/generated/utsversion.h
>>   CC      init/version-timestamp.o
>>   LD      .tmp_vmlinux.btf
>> ld: vmlinux.o: in function `netfilter_init':
>> /home/marvin/linux/kernel/linux_torvalds/net/netfilter/core.c:819: undefined reference to `netfilter_lwtunnel_init'
>> ld: /home/marvin/linux/kernel/linux_torvalds/net/netfilter/core.c:830: undefined reference to `netfilter_lwtunnel_fini'
>>   BTF     .btf.vmlinux.bin.o
>> pahole: .tmp_vmlinux.btf: Invalid argument
>>   LD      .tmp_vmlinux.kallsyms1
>> .btf.vmlinux.bin.o: file not recognized: file format not recognized
>> make[5]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 1
>> make[4]: *** [Makefile:1171: vmlinux] Error 2
>> make[3]: *** [debian/rules:74: build-arch] Error 2
>> dpkg-buildpackage: error: make -f debian/rules binary subprocess returned exit status 2
>> make[2]: *** [scripts/Makefile.package:121: bindeb-pkg] Error 2
>> make[1]: *** [/home/marvin/linux/kernel/linux_torvalds/Makefile:1555: bindeb-pkg] Error 2
>> make: *** [Makefile:240: __sub-make] Error 2
>>
>> real	0m26.260s
>> user	0m27.888s
>> sys	0m8.518s
>> Sat Jun 22 21:28:10 CEST 2024
>> marvin@defiant:~/linux/kernel/linux_torvalds$ ls -l .config
>> -rw-rw-r-- 1 marvin marvin 110785 Jun 22 21:24 .config
>> marvin@defiant:~/linux/kernel/linux_torvalds$ 
>>
>> Is this bound to happen sometimes, or should all "make randconfig" configurations be at least compilable?
>>
>> Thank you.
>>
>> Best regards,
>> Mirsad Todorovac
> 
>> #
>> # Automatically generated file; DO NOT EDIT.
>> # Linux/x86 6.10.0-rc4 Kernel Configuration
>> #
>> CONFIG_CC_VERSION_TEXT="gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
>> CONFIG_CC_IS_GCC=y
>> CONFIG_GCC_VERSION=110400
>> CONFIG_CLANG_VERSION=0
>> CONFIG_AS_IS_GNU=y
>> CONFIG_AS_VERSION=23800
>> CONFIG_LD_IS_BFD=y
>> CONFIG_LD_VERSION=23800
>> CONFIG_LLD_VERSION=0
>> CONFIG_CC_CAN_LINK=y
>> CONFIG_CC_CAN_LINK_STATIC=y
>> CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
>> CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
>> CONFIG_GCC_ASM_GOTO_OUTPUT_WORKAROUND=y
>> CONFIG_TOOLS_SUPPORT_RELR=y
>> CONFIG_CC_HAS_ASM_INLINE=y
>> CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
>> CONFIG_PAHOLE_VERSION=125
>> CONFIG_IRQ_WORK=y
>> CONFIG_BUILDTIME_TABLE_SORT=y
>> CONFIG_THREAD_INFO_IN_TASK=y
>>
>> #
>> # General setup
>> #
>> CONFIG_INIT_ENV_ARG_LIMIT=32
>> # CONFIG_COMPILE_TEST is not set
>> CONFIG_WERROR=y
>> # CONFIG_UAPI_HEADER_TEST is not set
>> CONFIG_LOCALVERSION=""
>> CONFIG_LOCALVERSION_AUTO=y
>> CONFIG_BUILD_SALT=""
>> CONFIG_HAVE_KERNEL_GZIP=y
>> CONFIG_HAVE_KERNEL_BZIP2=y
>> CONFIG_HAVE_KERNEL_LZMA=y
>> CONFIG_HAVE_KERNEL_XZ=y
>> CONFIG_HAVE_KERNEL_LZO=y
>> CONFIG_HAVE_KERNEL_LZ4=y
>> CONFIG_HAVE_KERNEL_ZSTD=y
>> # CONFIG_KERNEL_GZIP is not set
>> # CONFIG_KERNEL_BZIP2 is not set
>> CONFIG_KERNEL_LZMA=y
>> # CONFIG_KERNEL_XZ is not set
>> # CONFIG_KERNEL_LZO is not set
>> # CONFIG_KERNEL_LZ4 is not set
>> # CONFIG_KERNEL_ZSTD is not set
>> CONFIG_DEFAULT_INIT=""
>> CONFIG_DEFAULT_HOSTNAME="(none)"
>> # CONFIG_SYSVIPC is not set
>> # CONFIG_POSIX_MQUEUE is not set
>> CONFIG_WATCH_QUEUE=y
>> CONFIG_CROSS_MEMORY_ATTACH=y
>> # CONFIG_USELIB is not set
>> CONFIG_AUDIT=y
>> CONFIG_HAVE_ARCH_AUDITSYSCALL=y
>> CONFIG_AUDITSYSCALL=y
>>
>> #
>> # IRQ subsystem
>> #
>> CONFIG_GENERIC_IRQ_PROBE=y
>> CONFIG_GENERIC_IRQ_SHOW=y
>> CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
>> CONFIG_GENERIC_PENDING_IRQ=y
>> CONFIG_GENERIC_IRQ_MIGRATION=y
>> CONFIG_HARDIRQS_SW_RESEND=y
>> CONFIG_IRQ_DOMAIN=y
>> CONFIG_IRQ_SIM=y
>> CONFIG_IRQ_DOMAIN_HIERARCHY=y
>> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
>> CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
>> CONFIG_IRQ_FORCED_THREADING=y
>> CONFIG_SPARSE_IRQ=y
>> # CONFIG_GENERIC_IRQ_DEBUGFS is not set
>> # end of IRQ subsystem
>>
>> CONFIG_CLOCKSOURCE_WATCHDOG=y
>> CONFIG_ARCH_CLOCKSOURCE_INIT=y
>> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
>> CONFIG_GENERIC_TIME_VSYSCALL=y
>> CONFIG_GENERIC_CLOCKEVENTS=y
>> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
>> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST_IDLE=y
>> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
>> CONFIG_GENERIC_CMOS_UPDATE=y
>> CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
>> # CONFIG_TIME_KUNIT_TEST is not set
>> CONFIG_CONTEXT_TRACKING=y
>> CONFIG_CONTEXT_TRACKING_IDLE=y
>>
>> #
>> # Timers subsystem
>> #
>> CONFIG_TICK_ONESHOT=y
>> CONFIG_NO_HZ_COMMON=y
>> # CONFIG_HZ_PERIODIC is not set
>> # CONFIG_NO_HZ_IDLE is not set
>> CONFIG_NO_HZ_FULL=y
>> CONFIG_CONTEXT_TRACKING_USER=y
>> # CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
>> CONFIG_NO_HZ=y
>> CONFIG_HIGH_RES_TIMERS=y
>> CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=125
>> # end of Timers subsystem
>>
>> CONFIG_BPF=y
>> CONFIG_HAVE_EBPF_JIT=y
>> CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y
>>
>> #
>> # BPF subsystem
>> #
>> CONFIG_BPF_SYSCALL=y
>> CONFIG_BPF_JIT=y
>> # CONFIG_BPF_JIT_ALWAYS_ON is not set
>> CONFIG_BPF_JIT_DEFAULT_ON=y
>> # CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
>> CONFIG_USERMODE_DRIVER=y
>> CONFIG_BPF_PRELOAD=y
>> CONFIG_BPF_PRELOAD_UMD=y
>> # end of BPF subsystem
>>
>> CONFIG_PREEMPT_BUILD=y
>> CONFIG_PREEMPT_NONE=y
>> # CONFIG_PREEMPT_VOLUNTARY is not set
>> # CONFIG_PREEMPT is not set
>> CONFIG_PREEMPT_COUNT=y
>> CONFIG_PREEMPTION=y
>> CONFIG_PREEMPT_DYNAMIC=y
>> # CONFIG_SCHED_CORE is not set
>>
>> #
>> # CPU/Task time and stats accounting
>> #
>> CONFIG_VIRT_CPU_ACCOUNTING=y
>> CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
>> CONFIG_IRQ_TIME_ACCOUNTING=y
>> CONFIG_HAVE_SCHED_AVG_IRQ=y
>> CONFIG_BSD_PROCESS_ACCT=y
>> CONFIG_BSD_PROCESS_ACCT_V3=y
>> CONFIG_TASKSTATS=y
>> # CONFIG_TASK_DELAY_ACCT is not set
>> CONFIG_TASK_XACCT=y
>> CONFIG_TASK_IO_ACCOUNTING=y
>> # CONFIG_PSI is not set
>> # end of CPU/Task time and stats accounting
>>
>> CONFIG_CPU_ISOLATION=y
>>
>> #
>> # RCU Subsystem
>> #
>> CONFIG_TREE_RCU=y
>> CONFIG_PREEMPT_RCU=y
>> CONFIG_RCU_EXPERT=y
>> CONFIG_TREE_SRCU=y
>> CONFIG_TASKS_RCU_GENERIC=y
>> # CONFIG_FORCE_TASKS_RCU is not set
>> CONFIG_NEED_TASKS_RCU=y
>> CONFIG_TASKS_RCU=y
>> CONFIG_FORCE_TASKS_RUDE_RCU=y
>> CONFIG_TASKS_RUDE_RCU=y
>> # CONFIG_FORCE_TASKS_TRACE_RCU is not set
>> CONFIG_TASKS_TRACE_RCU=y
>> CONFIG_RCU_STALL_COMMON=y
>> CONFIG_RCU_NEED_SEGCBLIST=y
>> CONFIG_RCU_FANOUT=64
>> CONFIG_RCU_FANOUT_LEAF=16
>> # CONFIG_RCU_BOOST is not set
>> CONFIG_RCU_NOCB_CPU=y
>> # CONFIG_RCU_NOCB_CPU_DEFAULT_ALL is not set
>> CONFIG_TASKS_TRACE_RCU_READ_MB=y
>> CONFIG_RCU_LAZY=y
>> CONFIG_RCU_LAZY_DEFAULT_OFF=y
>> CONFIG_RCU_DOUBLE_CHECK_CB_TIME=y
>> # end of RCU Subsystem
>>
>> # CONFIG_IKCONFIG is not set
>> CONFIG_IKHEADERS=y
>> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y
>>
>> #
>> # Scheduler features
>> #
>> # end of Scheduler features
>>
>> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
>> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
>> CONFIG_CC_HAS_INT128=y
>> CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
>> CONFIG_GCC10_NO_ARRAY_BOUNDS=y
>> CONFIG_CC_NO_ARRAY_BOUNDS=y
>> CONFIG_GCC_NO_STRINGOP_OVERFLOW=y
>> CONFIG_CC_NO_STRINGOP_OVERFLOW=y
>> CONFIG_ARCH_SUPPORTS_INT128=y
>> # CONFIG_CGROUPS is not set
>> CONFIG_NAMESPACES=y
>> # CONFIG_UTS_NS is not set
>> CONFIG_TIME_NS=y
>> CONFIG_USER_NS=y
>> # CONFIG_PID_NS is not set
>> CONFIG_NET_NS=y
>> # CONFIG_SCHED_AUTOGROUP is not set
>> CONFIG_RELAY=y
>> # CONFIG_BLK_DEV_INITRD is not set
>> # CONFIG_BOOT_CONFIG is not set
>> # CONFIG_INITRAMFS_PRESERVE_MTIME is not set
>> # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
>> CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>> CONFIG_LD_ORPHAN_WARN=y
>> CONFIG_LD_ORPHAN_WARN_LEVEL="error"
>> CONFIG_HAVE_UID16=y
>> CONFIG_SYSCTL_EXCEPTION_TRACE=y
>> CONFIG_HAVE_PCSPKR_PLATFORM=y
>> CONFIG_EXPERT=y
>> CONFIG_UID16=y
>> CONFIG_MULTIUSER=y
>> CONFIG_SGETMASK_SYSCALL=y
>> CONFIG_SYSFS_SYSCALL=y
>> CONFIG_FHANDLE=y
>> # CONFIG_POSIX_TIMERS is not set
>> # CONFIG_PRINTK is not set
>> # CONFIG_BUG is not set
>> # CONFIG_PCSPKR_PLATFORM is not set
>> # CONFIG_BASE_SMALL is not set
>> # CONFIG_FUTEX is not set
>> CONFIG_EPOLL=y
>> # CONFIG_SIGNALFD is not set
>> # CONFIG_TIMERFD is not set
>> # CONFIG_EVENTFD is not set
>> # CONFIG_SHMEM is not set
>> CONFIG_AIO=y
>> # CONFIG_IO_URING is not set
>> CONFIG_ADVISE_SYSCALLS=y
>> CONFIG_MEMBARRIER=y
>> CONFIG_KCMP=y
>> # CONFIG_RSEQ is not set
>> CONFIG_CACHESTAT_SYSCALL=y
>> CONFIG_PC104=y
>> CONFIG_KALLSYMS=y
>> CONFIG_KALLSYMS_SELFTEST=y
>> CONFIG_KALLSYMS_ALL=y
>> CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
>> CONFIG_KALLSYMS_BASE_RELATIVE=y
>> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
>> CONFIG_HAVE_PERF_EVENTS=y
>>
>> #
>> # Kernel Performance Events And Counters
>> #
>> CONFIG_PERF_EVENTS=y
>> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
>> # end of Kernel Performance Events And Counters
>>
>> CONFIG_PROFILING=y
>> CONFIG_TRACEPOINTS=y
>>
>> #
>> # Kexec and crash features
>> #
>> # CONFIG_KEXEC is not set
>> # CONFIG_KEXEC_FILE is not set
>> # end of Kexec and crash features
>> # end of General setup
>>
>> CONFIG_64BIT=y
>> CONFIG_X86_64=y
>> CONFIG_X86=y
>> CONFIG_INSTRUCTION_DECODER=y
>> CONFIG_OUTPUT_FORMAT="elf64-x86-64"
>> CONFIG_LOCKDEP_SUPPORT=y
>> CONFIG_STACKTRACE_SUPPORT=y
>> CONFIG_MMU=y
>> CONFIG_ARCH_MMAP_RND_BITS_MIN=28
>> CONFIG_ARCH_MMAP_RND_BITS_MAX=32
>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
>> CONFIG_GENERIC_ISA_DMA=y
>> CONFIG_ARCH_MAY_HAVE_PC_FDC=y
>> CONFIG_GENERIC_CALIBRATE_DELAY=y
>> CONFIG_ARCH_HAS_CPU_RELAX=y
>> CONFIG_ARCH_HIBERNATION_POSSIBLE=y
>> CONFIG_ARCH_SUSPEND_POSSIBLE=y
>> CONFIG_AUDIT_ARCH=y
>> CONFIG_X86_64_SMP=y
>> CONFIG_ARCH_SUPPORTS_UPROBES=y
>> CONFIG_FIX_EARLYCON_MEM=y
>> CONFIG_PGTABLE_LEVELS=4
>> CONFIG_CC_HAS_SANE_STACKPROTECTOR=y
>>
>> #
>> # Processor type and features
>> #
>> CONFIG_SMP=y
>> CONFIG_X86_X2APIC=y
>> CONFIG_X86_MPPARSE=y
>> # CONFIG_X86_CPU_RESCTRL is not set
>> # CONFIG_X86_FRED is not set
>> # CONFIG_X86_EXTENDED_PLATFORM is not set
>> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
>> CONFIG_SCHED_OMIT_FRAME_POINTER=y
>> CONFIG_HYPERVISOR_GUEST=y
>> CONFIG_PARAVIRT=y
>> CONFIG_PARAVIRT_DEBUG=y
>> # CONFIG_PARAVIRT_SPINLOCKS is not set
>> CONFIG_X86_HV_CALLBACK_VECTOR=y
>> # CONFIG_XEN is not set
>> # CONFIG_KVM_GUEST is not set
>> # CONFIG_ARCH_CPUIDLE_HALTPOLL is not set
>> # CONFIG_PVH is not set
>> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
>> # CONFIG_ACRN_GUEST is not set
>> # CONFIG_MK8 is not set
>> # CONFIG_MPSC is not set
>> CONFIG_MCORE2=y
>> # CONFIG_MATOM is not set
>> # CONFIG_GENERIC_CPU is not set
>> CONFIG_X86_INTERNODE_CACHE_SHIFT=6
>> CONFIG_X86_L1_CACHE_SHIFT=6
>> CONFIG_X86_INTEL_USERCOPY=y
>> CONFIG_X86_USE_PPRO_CHECKSUM=y
>> CONFIG_X86_P6_NOP=y
>> CONFIG_X86_TSC=y
>> CONFIG_X86_HAVE_PAE=y
>> CONFIG_X86_CMPXCHG64=y
>> CONFIG_X86_CMOV=y
>> CONFIG_X86_MINIMUM_CPU_FAMILY=64
>> CONFIG_X86_DEBUGCTLMSR=y
>> CONFIG_IA32_FEAT_CTL=y
>> CONFIG_X86_VMX_FEATURE_NAMES=y
>> # CONFIG_PROCESSOR_SELECT is not set
>> CONFIG_CPU_SUP_INTEL=y
>> CONFIG_CPU_SUP_AMD=y
>> CONFIG_CPU_SUP_HYGON=y
>> CONFIG_CPU_SUP_CENTAUR=y
>> CONFIG_CPU_SUP_ZHAOXIN=y
>> CONFIG_HPET_TIMER=y
>> CONFIG_HPET_EMULATE_RTC=y
>> # CONFIG_DMI is not set
>> CONFIG_MAXSMP=y
>> CONFIG_NR_CPUS_RANGE_BEGIN=8192
>> CONFIG_NR_CPUS_RANGE_END=8192
>> CONFIG_NR_CPUS_DEFAULT=8192
>> CONFIG_NR_CPUS=8192
>> # CONFIG_SCHED_CLUSTER is not set
>> CONFIG_SCHED_SMT=y
>> # CONFIG_SCHED_MC is not set
>> CONFIG_X86_LOCAL_APIC=y
>> CONFIG_X86_IO_APIC=y
>> # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
>> CONFIG_X86_MCE=y
>> # CONFIG_X86_MCELOG_LEGACY is not set
>> # CONFIG_X86_MCE_INTEL is not set
>> CONFIG_X86_MCE_INJECT=y
>>
>> #
>> # Performance monitoring
>> #
>> CONFIG_PERF_EVENTS_AMD_POWER=y
>> CONFIG_PERF_EVENTS_AMD_UNCORE=y
>> CONFIG_PERF_EVENTS_AMD_BRS=y
>> # end of Performance monitoring
>>
>> CONFIG_X86_VSYSCALL_EMULATION=y
>> # CONFIG_X86_IOPL_IOPERM is not set
>> CONFIG_MICROCODE=y
>> CONFIG_MICROCODE_LATE_LOADING=y
>> # CONFIG_MICROCODE_LATE_FORCE_MINREV is not set
>> CONFIG_X86_MSR=y
>> CONFIG_X86_CPUID=y
>> # CONFIG_X86_5LEVEL is not set
>> CONFIG_X86_DIRECT_GBPAGES=y
>> CONFIG_X86_CPA_STATISTICS=y
>> # CONFIG_NUMA is not set
>> CONFIG_ARCH_SPARSEMEM_ENABLE=y
>> CONFIG_ARCH_SPARSEMEM_DEFAULT=y
>> CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
>> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
>> CONFIG_MTRR=y
>> # CONFIG_MTRR_SANITIZER is not set
>> # CONFIG_X86_PAT is not set
>> CONFIG_X86_UMIP=y
>> CONFIG_CC_HAS_IBT=y
>> CONFIG_X86_CET=y
>> CONFIG_X86_KERNEL_IBT=y
>> # CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
>> CONFIG_X86_INTEL_TSX_MODE_OFF=y
>> # CONFIG_X86_INTEL_TSX_MODE_ON is not set
>> # CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
>> # CONFIG_X86_SGX is not set
>> CONFIG_X86_USER_SHADOW_STACK=y
>> # CONFIG_HZ_100 is not set
>> CONFIG_HZ_250=y
>> # CONFIG_HZ_300 is not set
>> # CONFIG_HZ_1000 is not set
>> CONFIG_HZ=250
>> CONFIG_SCHED_HRTICK=y
>> CONFIG_ARCH_SUPPORTS_KEXEC=y
>> CONFIG_ARCH_SUPPORTS_KEXEC_FILE=y
>> CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY=y
>> CONFIG_ARCH_SUPPORTS_KEXEC_SIG=y
>> CONFIG_ARCH_SUPPORTS_KEXEC_SIG_FORCE=y
>> CONFIG_ARCH_SUPPORTS_KEXEC_BZIMAGE_VERIFY_SIG=y
>> CONFIG_ARCH_SUPPORTS_KEXEC_JUMP=y
>> CONFIG_ARCH_SUPPORTS_CRASH_DUMP=y
>> CONFIG_ARCH_SUPPORTS_CRASH_HOTPLUG=y
>> CONFIG_PHYSICAL_START=0x1000000
>> CONFIG_RELOCATABLE=y
>> # CONFIG_RANDOMIZE_BASE is not set
>> CONFIG_PHYSICAL_ALIGN=0x200000
>> CONFIG_ADDRESS_MASKING=y
>> CONFIG_HOTPLUG_CPU=y
>> # CONFIG_COMPAT_VDSO is not set
>> CONFIG_LEGACY_VSYSCALL_XONLY=y
>> # CONFIG_LEGACY_VSYSCALL_NONE is not set
>> CONFIG_CMDLINE_BOOL=y
>> CONFIG_CMDLINE=""
>> # CONFIG_MODIFY_LDT_SYSCALL is not set
>> CONFIG_STRICT_SIGALTSTACK_SIZE=y
>> CONFIG_HAVE_LIVEPATCH=y
>> # end of Processor type and features
>>
>> CONFIG_CC_HAS_NAMED_AS=y
>> CONFIG_USE_X86_SEG_SUPPORT=y
>> CONFIG_CC_HAS_SLS=y
>> CONFIG_CC_HAS_RETURN_THUNK=y
>> CONFIG_CC_HAS_ENTRY_PADDING=y
>> CONFIG_FUNCTION_PADDING_CFI=11
>> CONFIG_FUNCTION_PADDING_BYTES=16
>> # CONFIG_CPU_MITIGATIONS is not set
>> CONFIG_ARCH_HAS_ADD_PAGES=y
>>
>> #
>> # Power management and ACPI options
>> #
>> CONFIG_SUSPEND=y
>> CONFIG_SUSPEND_FREEZER=y
>> # CONFIG_SUSPEND_SKIP_SYNC is not set
>> CONFIG_PM_SLEEP=y
>> CONFIG_PM_SLEEP_SMP=y
>> CONFIG_PM_AUTOSLEEP=y
>> CONFIG_PM_USERSPACE_AUTOSLEEP=y
>> # CONFIG_PM_WAKELOCKS is not set
>> CONFIG_PM=y
>> CONFIG_PM_DEBUG=y
>> # CONFIG_PM_ADVANCED_DEBUG is not set
>> # CONFIG_PM_TEST_SUSPEND is not set
>> CONFIG_PM_SLEEP_DEBUG=y
>> CONFIG_PM_TRACE=y
>> CONFIG_PM_TRACE_RTC=y
>> CONFIG_PM_CLK=y
>> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
>> CONFIG_ARCH_SUPPORTS_ACPI=y
>> # CONFIG_ACPI is not set
>>
>> #
>> # CPU Frequency scaling
>> #
>> # CONFIG_CPU_FREQ is not set
>> # end of CPU Frequency scaling
>>
>> #
>> # CPU Idle
>> #
>> # CONFIG_CPU_IDLE is not set
>> # end of CPU Idle
>> # end of Power management and ACPI options
>>
>> #
>> # Bus options (PCI etc.)
>> #
>> # CONFIG_ISA_BUS is not set
>> CONFIG_ISA_DMA_API=y
>> # end of Bus options (PCI etc.)
>>
>> #
>> # Binary Emulations
>> #
>> CONFIG_IA32_EMULATION=y
>> # CONFIG_IA32_EMULATION_DEFAULT_DISABLED is not set
>> CONFIG_X86_X32_ABI=y
>> CONFIG_COMPAT_32=y
>> CONFIG_COMPAT=y
>> CONFIG_COMPAT_FOR_U64_ALIGNMENT=y
>> # end of Binary Emulations
>>
>> # CONFIG_VIRTUALIZATION is not set
>> CONFIG_AS_AVX512=y
>> CONFIG_AS_SHA1_NI=y
>> CONFIG_AS_SHA256_NI=y
>> CONFIG_AS_TPAUSE=y
>> CONFIG_AS_GFNI=y
>> CONFIG_AS_VAES=y
>> CONFIG_AS_VPCLMULQDQ=y
>> CONFIG_AS_WRUSS=y
>> CONFIG_ARCH_CONFIGURES_CPU_MITIGATIONS=y
>>
>> #
>> # General architecture-dependent options
>> #
>> CONFIG_HOTPLUG_SMT=y
>> CONFIG_HOTPLUG_CORE_SYNC=y
>> CONFIG_HOTPLUG_CORE_SYNC_DEAD=y
>> CONFIG_HOTPLUG_CORE_SYNC_FULL=y
>> CONFIG_HOTPLUG_SPLIT_STARTUP=y
>> CONFIG_HOTPLUG_PARALLEL=y
>> CONFIG_GENERIC_ENTRY=y
>> CONFIG_KPROBES=y
>> # CONFIG_JUMP_LABEL is not set
>> CONFIG_STATIC_CALL_SELFTEST=y
>> CONFIG_OPTPROBES=y
>> CONFIG_KPROBES_ON_FTRACE=y
>> CONFIG_UPROBES=y
>> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
>> CONFIG_ARCH_USE_BUILTIN_BSWAP=y
>> CONFIG_KRETPROBES=y
>> CONFIG_KRETPROBE_ON_RETHOOK=y
>> CONFIG_HAVE_IOREMAP_PROT=y
>> CONFIG_HAVE_KPROBES=y
>> CONFIG_HAVE_KRETPROBES=y
>> CONFIG_HAVE_OPTPROBES=y
>> CONFIG_HAVE_KPROBES_ON_FTRACE=y
>> CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
>> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
>> CONFIG_HAVE_NMI=y
>> CONFIG_TRACE_IRQFLAGS_SUPPORT=y
>> CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
>> CONFIG_HAVE_ARCH_TRACEHOOK=y
>> CONFIG_HAVE_DMA_CONTIGUOUS=y
>> CONFIG_GENERIC_SMP_IDLE_THREAD=y
>> CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
>> CONFIG_ARCH_HAS_SET_MEMORY=y
>> CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
>> CONFIG_ARCH_HAS_CPU_FINALIZE_INIT=y
>> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
>> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
>> CONFIG_ARCH_WANTS_NO_INSTR=y
>> CONFIG_HAVE_ASM_MODVERSIONS=y
>> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
>> CONFIG_HAVE_RSEQ=y
>> CONFIG_HAVE_RUST=y
>> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
>> CONFIG_HAVE_HW_BREAKPOINT=y
>> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
>> CONFIG_HAVE_USER_RETURN_NOTIFIER=y
>> CONFIG_HAVE_PERF_EVENTS_NMI=y
>> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
>> CONFIG_HAVE_PERF_REGS=y
>> CONFIG_HAVE_PERF_USER_STACK_DUMP=y
>> CONFIG_HAVE_ARCH_JUMP_LABEL=y
>> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
>> CONFIG_MMU_GATHER_TABLE_FREE=y
>> CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
>> CONFIG_MMU_GATHER_MERGE_VMAS=y
>> CONFIG_MMU_LAZY_TLB_REFCOUNT=y
>> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
>> CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS=y
>> CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
>> CONFIG_HAVE_CMPXCHG_LOCAL=y
>> CONFIG_HAVE_CMPXCHG_DOUBLE=y
>> CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
>> CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
>> CONFIG_HAVE_ARCH_SECCOMP=y
>> CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
>> CONFIG_SECCOMP=y
>> CONFIG_SECCOMP_FILTER=y
>> CONFIG_HAVE_ARCH_STACKLEAK=y
>> CONFIG_HAVE_STACKPROTECTOR=y
>> CONFIG_STACKPROTECTOR=y
>> # CONFIG_STACKPROTECTOR_STRONG is not set
>> CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
>> CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
>> CONFIG_LTO_NONE=y
>> CONFIG_ARCH_SUPPORTS_CFI_CLANG=y
>> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
>> CONFIG_HAVE_CONTEXT_TRACKING_USER=y
>> CONFIG_HAVE_CONTEXT_TRACKING_USER_OFFSTACK=y
>> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
>> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
>> CONFIG_HAVE_MOVE_PUD=y
>> CONFIG_HAVE_MOVE_PMD=y
>> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
>> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
>> CONFIG_HAVE_ARCH_HUGE_VMAP=y
>> CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
>> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
>> CONFIG_ARCH_WANT_PMD_MKWRITE=y
>> CONFIG_HAVE_ARCH_SOFT_DIRTY=y
>> CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
>> CONFIG_MODULES_USE_ELF_RELA=y
>> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
>> CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
>> CONFIG_SOFTIRQ_ON_OWN_STACK=y
>> CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
>> CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
>> CONFIG_HAVE_EXIT_THREAD=y
>> CONFIG_ARCH_MMAP_RND_BITS=28
>> CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS=8
>> CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=y
>> CONFIG_HAVE_PAGE_SIZE_4KB=y
>> CONFIG_PAGE_SIZE_4KB=y
>> CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
>> CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
>> CONFIG_PAGE_SHIFT=12
>> CONFIG_HAVE_OBJTOOL=y
>> CONFIG_HAVE_JUMP_LABEL_HACK=y
>> CONFIG_HAVE_NOINSTR_HACK=y
>> CONFIG_HAVE_NOINSTR_VALIDATION=y
>> CONFIG_HAVE_UACCESS_VALIDATION=y
>> CONFIG_HAVE_STACK_VALIDATION=y
>> CONFIG_HAVE_RELIABLE_STACKTRACE=y
>> CONFIG_ISA_BUS_API=y
>> CONFIG_OLD_SIGSUSPEND3=y
>> CONFIG_COMPAT_OLD_SIGACTION=y
>> # CONFIG_COMPAT_32BIT_TIME is not set
>> CONFIG_HAVE_ARCH_VMAP_STACK=y
>> # CONFIG_VMAP_STACK is not set
>> CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
>> # CONFIG_RANDOMIZE_KSTACK_OFFSET is not set
>> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
>> CONFIG_STRICT_KERNEL_RWX=y
>> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
>> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
>> # CONFIG_LOCK_EVENT_COUNTS is not set
>> CONFIG_ARCH_HAS_MEM_ENCRYPT=y
>> CONFIG_HAVE_STATIC_CALL=y
>> CONFIG_HAVE_STATIC_CALL_INLINE=y
>> CONFIG_HAVE_PREEMPT_DYNAMIC=y
>> CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
>> CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
>> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
>> CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
>> CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
>> CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
>> CONFIG_DYNAMIC_SIGFRAME=y
>> CONFIG_ARCH_HAS_HW_PTE_YOUNG=y
>> CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y
>> CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y
>>
>> #
>> # GCOV-based kernel profiling
>> #
>> # CONFIG_GCOV_KERNEL is not set
>> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
>> # end of GCOV-based kernel profiling
>>
>> CONFIG_HAVE_GCC_PLUGINS=y
>> CONFIG_FUNCTION_ALIGNMENT_4B=y
>> CONFIG_FUNCTION_ALIGNMENT_16B=y
>> CONFIG_FUNCTION_ALIGNMENT=16
>> # end of General architecture-dependent options
>>
>> CONFIG_RT_MUTEXES=y
>> # CONFIG_MODULES is not set
>> # CONFIG_BLOCK is not set
>> CONFIG_PADATA=y
>> CONFIG_ASN1=y
>> CONFIG_UNINLINE_SPIN_UNLOCK=y
>> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
>> CONFIG_MUTEX_SPIN_ON_OWNER=y
>> CONFIG_RWSEM_SPIN_ON_OWNER=y
>> CONFIG_LOCK_SPIN_ON_OWNER=y
>> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
>> CONFIG_QUEUED_SPINLOCKS=y
>> CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
>> CONFIG_QUEUED_RWLOCKS=y
>> CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
>> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
>> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
>> CONFIG_FREEZER=y
>>
>> #
>> # Executable file formats
>> #
>> CONFIG_BINFMT_ELF=y
>> CONFIG_BINFMT_ELF_KUNIT_TEST=y
>> CONFIG_COMPAT_BINFMT_ELF=y
>> CONFIG_ELFCORE=y
>> CONFIG_BINFMT_SCRIPT=y
>> # CONFIG_BINFMT_MISC is not set
>> # CONFIG_COREDUMP is not set
>> # end of Executable file formats
>>
>> #
>> # Memory Management options
>> #
>>
>> #
>> # Slab allocator options
>> #
>> CONFIG_SLUB=y
>> CONFIG_SLUB_TINY=y
>> CONFIG_SLAB_MERGE_DEFAULT=y
>> # end of Slab allocator options
>>
>> # CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
>> CONFIG_COMPAT_BRK=y
>> CONFIG_SPARSEMEM=y
>> CONFIG_SPARSEMEM_EXTREME=y
>> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
>> # CONFIG_SPARSEMEM_VMEMMAP is not set
>> CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=y
>> CONFIG_ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP=y
>> CONFIG_HAVE_GUP_FAST=y
>> CONFIG_MEMORY_ISOLATION=y
>> CONFIG_EXCLUSIVE_SYSTEM_RAM=y
>> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
>> # CONFIG_MEMORY_HOTPLUG is not set
>> CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y
>> CONFIG_SPLIT_PTLOCK_CPUS=4
>> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
>> CONFIG_COMPACTION=y
>> CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
>> CONFIG_PAGE_REPORTING=y
>> CONFIG_MIGRATION=y
>> CONFIG_ARCH_ENABLE_THP_MIGRATION=y
>> CONFIG_CONTIG_ALLOC=y
>> CONFIG_PCP_BATCH_SCALE_MAX=5
>> CONFIG_PHYS_ADDR_T_64BIT=y
>> CONFIG_KSM=y
>> CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
>> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
>> # CONFIG_MEMORY_FAILURE is not set
>> CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
>> CONFIG_ARCH_WANTS_THP_SWAP=y
>> CONFIG_TRANSPARENT_HUGEPAGE=y
>> CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
>> # CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
>> # CONFIG_TRANSPARENT_HUGEPAGE_NEVER is not set
>> CONFIG_PGTABLE_HAS_HUGE_LEAVES=y
>> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
>> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
>> CONFIG_HAVE_SETUP_PER_CPU_AREA=y
>> CONFIG_CMA=y
>> # CONFIG_CMA_DEBUGFS is not set
>> # CONFIG_CMA_SYSFS is not set
>> CONFIG_CMA_AREAS=8
>> CONFIG_GENERIC_EARLY_IOREMAP=y
>> CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
>> # CONFIG_IDLE_PAGE_TRACKING is not set
>> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
>> CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
>> CONFIG_ARCH_HAS_PTE_DEVMAP=y
>> CONFIG_ARCH_HAS_ZONE_DMA_SET=y
>> CONFIG_ZONE_DMA=y
>> CONFIG_ZONE_DMA32=y
>> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
>> # CONFIG_VM_EVENT_COUNTERS is not set
>> # CONFIG_PERCPU_STATS is not set
>> CONFIG_GUP_TEST=y
>> # CONFIG_DMAPOOL_TEST is not set
>> CONFIG_ARCH_HAS_PTE_SPECIAL=y
>> # CONFIG_MEMFD_CREATE is not set
>> # CONFIG_SECRETMEM is not set
>> CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
>> CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
>> CONFIG_USERFAULTFD=y
>> CONFIG_PTE_MARKER_UFFD_WP=y
>> CONFIG_LRU_GEN=y
>> CONFIG_LRU_GEN_ENABLED=y
>> CONFIG_LRU_GEN_STATS=y
>> CONFIG_LRU_GEN_WALKS_MMU=y
>> CONFIG_ARCH_SUPPORTS_PER_VMA_LOCK=y
>> CONFIG_PER_VMA_LOCK=y
>> CONFIG_LOCK_MM_AND_FIND_VMA=y
>> CONFIG_EXECMEM=y
>>
>> #
>> # Data Access Monitoring
>> #
>> # CONFIG_DAMON is not set
>> # end of Data Access Monitoring
>> # end of Memory Management options
>>
>> CONFIG_NET=y
>> CONFIG_NET_INGRESS=y
>> CONFIG_NET_EGRESS=y
>> CONFIG_NET_XGRESS=y
>>
>> #
>> # Networking options
>> #
>> CONFIG_PACKET=y
>> CONFIG_PACKET_DIAG=y
>> CONFIG_UNIX=y
>> CONFIG_AF_UNIX_OOB=y
>> CONFIG_UNIX_DIAG=y
>> CONFIG_XDP_SOCKETS=y
>> # CONFIG_XDP_SOCKETS_DIAG is not set
>> # CONFIG_NET_HANDSHAKE_KUNIT_TEST is not set
>> # CONFIG_INET is not set
>> CONFIG_NETWORK_SECMARK=y
>> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
>> CONFIG_NETFILTER=y
>> CONFIG_NETFILTER_ADVANCED=y
>> CONFIG_ATM=y
>> CONFIG_ATM_LANE=y
>> CONFIG_STP=y
>> CONFIG_MRP=y
>> CONFIG_BRIDGE=y
>> CONFIG_BRIDGE_VLAN_FILTERING=y
>> CONFIG_BRIDGE_MRP=y
>> # CONFIG_BRIDGE_CFM is not set
>> CONFIG_VLAN_8021Q=y
>> # CONFIG_VLAN_8021Q_GVRP is not set
>> CONFIG_VLAN_8021Q_MVRP=y
>> CONFIG_LLC=y
>> CONFIG_LLC2=y
>> CONFIG_ATALK=y
>> CONFIG_X25=y
>> # CONFIG_LAPB is not set
>> CONFIG_PHONET=y
>> CONFIG_IEEE802154=y
>> # CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
>> CONFIG_IEEE802154_SOCKET=y
>> # CONFIG_MAC802154 is not set
>> # CONFIG_NET_SCHED is not set
>> CONFIG_DCB=y
>> CONFIG_DNS_RESOLVER=y
>> CONFIG_BATMAN_ADV=y
>> # CONFIG_BATMAN_ADV_BATMAN_V is not set
>> CONFIG_BATMAN_ADV_NC=y
>> # CONFIG_BATMAN_ADV_DEBUG is not set
>> # CONFIG_BATMAN_ADV_TRACING is not set
>> CONFIG_VSOCKETS=y
>> CONFIG_VSOCKETS_DIAG=y
>> # CONFIG_VSOCKETS_LOOPBACK is not set
>> # CONFIG_VIRTIO_VSOCKETS is not set
>> # CONFIG_HYPERV_VSOCKETS is not set
>> # CONFIG_NETLINK_DIAG is not set
>> CONFIG_MPLS=y
>> CONFIG_NET_MPLS_GSO=y
>> CONFIG_NET_NSH=y
>> # CONFIG_HSR is not set
>> CONFIG_QRTR=y
>> CONFIG_QRTR_SMD=y
>> CONFIG_QRTR_TUN=y
>> # CONFIG_PCPU_DEV_REFCNT is not set
>> CONFIG_MAX_SKB_FRAGS=17
>> CONFIG_RPS=y
>> CONFIG_RFS_ACCEL=y
>> CONFIG_SOCK_RX_QUEUE_MAPPING=y
>> CONFIG_XPS=y
>> CONFIG_NET_RX_BUSY_POLL=y
>> # CONFIG_BQL is not set
>> CONFIG_NET_FLOW_LIMIT=y
>>
>> #
>> # Network testing
>> #
>> # end of Network testing
>> # end of Networking options
>>
>> # CONFIG_HAMRADIO is not set
>> CONFIG_CAN=y
>> CONFIG_CAN_RAW=y
>> CONFIG_CAN_BCM=y
>> CONFIG_CAN_GW=y
>> CONFIG_CAN_J1939=y
>> # CONFIG_CAN_ISOTP is not set
>> CONFIG_BT=y
>> CONFIG_BT_BREDR=y
>> # CONFIG_BT_RFCOMM is not set
>> # CONFIG_BT_BNEP is not set
>> # CONFIG_BT_CMTP is not set
>> # CONFIG_BT_LE is not set
>> # CONFIG_BT_LEDS is not set
>> CONFIG_BT_MSFTEXT=y
>> # CONFIG_BT_AOSPEXT is not set
>> # CONFIG_BT_DEBUGFS is not set
>> # CONFIG_BT_SELFTEST is not set
>> # CONFIG_BT_FEATURE_DEBUG is not set
>>
>> #
>> # Bluetooth device drivers
>> #
>> CONFIG_BT_INTEL=y
>> CONFIG_BT_BCM=y
>> CONFIG_BT_RTL=y
>> CONFIG_BT_HCIBTUSB=y
>> CONFIG_BT_HCIBTUSB_AUTOSUSPEND=y
>> CONFIG_BT_HCIBTUSB_POLL_SYNC=y
>> CONFIG_BT_HCIBTUSB_BCM=y
>> # CONFIG_BT_HCIBTUSB_MTK is not set
>> CONFIG_BT_HCIBTUSB_RTL=y
>> CONFIG_BT_HCIBTSDIO=y
>> # CONFIG_BT_HCIBCM203X is not set
>> CONFIG_BT_HCIBPA10X=y
>> # CONFIG_BT_HCIBFUSB is not set
>> CONFIG_BT_HCIVHCI=y
>> # CONFIG_BT_MRVL is not set
>> CONFIG_BT_ATH3K=y
>> # CONFIG_BT_MTKSDIO is not set
>> # CONFIG_BT_VIRTIO is not set
>> # end of Bluetooth device drivers
>>
>> # CONFIG_MCTP is not set
>> CONFIG_WIRELESS=y
>> # CONFIG_CFG80211 is not set
>>
>> #
>> # CFG80211 needs to be enabled for MAC80211
>> #
>> CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
>> CONFIG_RFKILL=y
>> CONFIG_RFKILL_GPIO=y
>> CONFIG_NET_9P=y
>> # CONFIG_NET_9P_FD is not set
>> # CONFIG_NET_9P_VIRTIO is not set
>> # CONFIG_NET_9P_DEBUG is not set
>> CONFIG_CAIF=y
>> # CONFIG_CAIF_DEBUG is not set
>> # CONFIG_CAIF_NETDEV is not set
>> CONFIG_CAIF_USB=y
>> CONFIG_NFC=y
>> CONFIG_NFC_DIGITAL=y
>> # CONFIG_NFC_NCI is not set
>> CONFIG_NFC_HCI=y
>> # CONFIG_NFC_SHDLC is not set
>>
>> #
>> # Near Field Communication (NFC) devices
>> #
>> CONFIG_NFC_SIM=y
>> # CONFIG_NFC_PORT100 is not set
>> CONFIG_NFC_PN533=y
>> CONFIG_NFC_PN533_USB=y
>> CONFIG_NFC_PN533_I2C=y
>> # end of Near Field Communication (NFC) devices
>>
>> CONFIG_PSAMPLE=y
>> # CONFIG_NET_IFE is not set
>> CONFIG_LWTUNNEL=y
>> CONFIG_NET_SOCK_MSG=y
>> CONFIG_NET_DEVLINK=y
>> CONFIG_PAGE_POOL=y
>> CONFIG_PAGE_POOL_STATS=y
>> CONFIG_FAILOVER=y
>> CONFIG_ETHTOOL_NETLINK=y
>> CONFIG_NETDEV_ADDR_LIST_TEST=y
>> CONFIG_NET_TEST=y
>>
>> #
>> # Device Drivers
>> #
>> CONFIG_HAVE_EISA=y
>> # CONFIG_EISA is not set
>> CONFIG_HAVE_PCI=y
>> CONFIG_GENERIC_PCI_IOMAP=y
>> # CONFIG_PCI is not set
>> CONFIG_PCCARD=y
>> # CONFIG_PCMCIA is not set
>>
>> #
>> # PC-card bridges
>> #
>>
>> #
>> # Generic Driver Options
>> #
>> CONFIG_UEVENT_HELPER=y
>> CONFIG_UEVENT_HELPER_PATH=""
>> CONFIG_DEVTMPFS=y
>> CONFIG_DEVTMPFS_MOUNT=y
>> CONFIG_DEVTMPFS_SAFE=y
>> # CONFIG_STANDALONE is not set
>> CONFIG_PREVENT_FIRMWARE_BUILD=y
>>
>> #
>> # Firmware loader
>> #
>> CONFIG_FW_LOADER=y
>> CONFIG_FW_LOADER_PAGED_BUF=y
>> CONFIG_FW_LOADER_SYSFS=y
>> CONFIG_EXTRA_FIRMWARE=""
>> # CONFIG_FW_LOADER_USER_HELPER is not set
>> # CONFIG_FW_LOADER_COMPRESS is not set
>> CONFIG_FW_CACHE=y
>> CONFIG_FW_UPLOAD=y
>> # end of Firmware loader
>>
>> CONFIG_WANT_DEV_COREDUMP=y
>> CONFIG_ALLOW_DEV_COREDUMP=y
>> CONFIG_DEV_COREDUMP=y
>> CONFIG_DEBUG_DRIVER=y
>> # CONFIG_DEBUG_DEVRES is not set
>> CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
>> # CONFIG_PM_QOS_KUNIT_TEST is not set
>> CONFIG_DM_KUNIT_TEST=y
>> # CONFIG_DRIVER_PE_KUNIT_TEST is not set
>> CONFIG_GENERIC_CPU_DEVICES=y
>> CONFIG_GENERIC_CPU_AUTOPROBE=y
>> CONFIG_GENERIC_CPU_VULNERABILITIES=y
>> CONFIG_REGMAP=y
>> # CONFIG_REGMAP_KUNIT is not set
>> # CONFIG_REGMAP_BUILD is not set
>> CONFIG_REGMAP_I2C=y
>> CONFIG_REGMAP_SLIMBUS=y
>> CONFIG_REGMAP_MMIO=y
>> CONFIG_REGMAP_IRQ=y
>> CONFIG_REGMAP_SOUNDWIRE=y
>> CONFIG_DMA_SHARED_BUFFER=y
>> CONFIG_DMA_FENCE_TRACE=y
>> # CONFIG_FW_DEVLINK_SYNC_STATE_TIMEOUT is not set
>> # end of Generic Driver Options
>>
>> #
>> # Bus devices
>> #
>> # CONFIG_MHI_BUS is not set
>> CONFIG_MHI_BUS_EP=y
>> # end of Bus devices
>>
>> #
>> # Cache Drivers
>> #
>> # end of Cache Drivers
>>
>> CONFIG_CONNECTOR=y
>> # CONFIG_PROC_EVENTS is not set
>>
>> #
>> # Firmware Drivers
>> #
>>
>> #
>> # ARM System Control and Management Interface Protocol
>> #
>> # end of ARM System Control and Management Interface Protocol
>>
>> # CONFIG_EDD is not set
>> CONFIG_FIRMWARE_MEMMAP=y
>> CONFIG_FW_CFG_SYSFS=y
>> CONFIG_FW_CFG_SYSFS_CMDLINE=y
>> # CONFIG_SYSFB_SIMPLEFB is not set
>> CONFIG_GOOGLE_FIRMWARE=y
>> CONFIG_GOOGLE_CBMEM=y
>> CONFIG_GOOGLE_COREBOOT_TABLE=y
>> CONFIG_GOOGLE_MEMCONSOLE=y
>> # CONFIG_GOOGLE_FRAMEBUFFER_COREBOOT is not set
>> CONFIG_GOOGLE_MEMCONSOLE_COREBOOT=y
>> CONFIG_GOOGLE_VPD=y
>>
>> #
>> # Qualcomm firmware drivers
>> #
>> # end of Qualcomm firmware drivers
>>
>> #
>> # Tegra firmware driver
>> #
>> # end of Tegra firmware driver
>> # end of Firmware Drivers
>>
>> # CONFIG_GNSS is not set
>> CONFIG_MTD=y
>>
>> #
>> # Partition parsers
>> #
>> CONFIG_MTD_CMDLINE_PARTS=y
>> # CONFIG_MTD_OF_PARTS is not set
>> CONFIG_MTD_REDBOOT_PARTS=y
>> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
>> # CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
>> CONFIG_MTD_REDBOOT_PARTS_READONLY=y
>> # end of Partition parsers
>>
>> #
>> # User Modules And Translation Layers
>> #
>> CONFIG_MTD_OOPS=y
>> CONFIG_MTD_PARTITIONED_MASTER=y
>>
>> #
>> # RAM/ROM/Flash chip drivers
>> #
>> # CONFIG_MTD_CFI is not set
>> CONFIG_MTD_JEDECPROBE=y
>> CONFIG_MTD_GEN_PROBE=y
>> CONFIG_MTD_CFI_ADV_OPTIONS=y
>> # CONFIG_MTD_CFI_NOSWAP is not set
>> # CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
>> CONFIG_MTD_CFI_LE_BYTE_SWAP=y
>> CONFIG_MTD_CFI_GEOMETRY=y
>> # CONFIG_MTD_MAP_BANK_WIDTH_1 is not set
>> CONFIG_MTD_MAP_BANK_WIDTH_2=y
>> # CONFIG_MTD_MAP_BANK_WIDTH_4 is not set
>> CONFIG_MTD_MAP_BANK_WIDTH_8=y
>> CONFIG_MTD_MAP_BANK_WIDTH_16=y
>> CONFIG_MTD_MAP_BANK_WIDTH_32=y
>> # CONFIG_MTD_CFI_I1 is not set
>> CONFIG_MTD_CFI_I2=y
>> # CONFIG_MTD_CFI_I4 is not set
>> # CONFIG_MTD_CFI_I8 is not set
>> CONFIG_MTD_OTP=y
>> # CONFIG_MTD_CFI_INTELEXT is not set
>> CONFIG_MTD_CFI_AMDSTD=y
>> # CONFIG_MTD_CFI_STAA is not set
>> CONFIG_MTD_CFI_UTIL=y
>> # CONFIG_MTD_RAM is not set
>> # CONFIG_MTD_ROM is not set
>> # CONFIG_MTD_ABSENT is not set
>> # end of RAM/ROM/Flash chip drivers
>>
>> #
>> # Mapping drivers for chip access
>> #
>> CONFIG_MTD_COMPLEX_MAPPINGS=y
>> CONFIG_MTD_PHYSMAP=y
>> CONFIG_MTD_PHYSMAP_COMPAT=y
>> CONFIG_MTD_PHYSMAP_START=0x8000000
>> CONFIG_MTD_PHYSMAP_LEN=0
>> CONFIG_MTD_PHYSMAP_BANKWIDTH=2
>> CONFIG_MTD_PHYSMAP_OF=y
>> CONFIG_MTD_PHYSMAP_VERSATILE=y
>> # CONFIG_MTD_PHYSMAP_GEMINI is not set
>> # CONFIG_MTD_PHYSMAP_GPIO_ADDR is not set
>> # CONFIG_MTD_AMD76XROM is not set
>> CONFIG_MTD_ICHXROM=y
>> CONFIG_MTD_NETtel=y
>> CONFIG_MTD_L440GX=y
>> # CONFIG_MTD_PLATRAM is not set
>> # end of Mapping drivers for chip access
>>
>> #
>> # Self-contained MTD device drivers
>> #
>> CONFIG_MTD_SLRAM=y
>> CONFIG_MTD_PHRAM=y
>> # CONFIG_MTD_MTDRAM is not set
>>
>> #
>> # Disk-On-Chip Device Drivers
>> #
>> CONFIG_MTD_DOCG3=y
>> CONFIG_BCH_CONST_M=14
>> CONFIG_BCH_CONST_T=4
>> # end of Self-contained MTD device drivers
>>
>> #
>> # NAND
>> #
>> CONFIG_MTD_NAND_CORE=y
>> # CONFIG_MTD_ONENAND is not set
>> CONFIG_MTD_RAW_NAND=y
>>
>> #
>> # Raw/parallel NAND flash controllers
>> #
>> # CONFIG_MTD_NAND_DENALI_DT is not set
>> CONFIG_MTD_NAND_MXIC=y
>> CONFIG_MTD_NAND_GPIO=y
>> CONFIG_MTD_NAND_PLATFORM=y
>> # CONFIG_MTD_NAND_CADENCE is not set
>> CONFIG_MTD_NAND_ARASAN=y
>> CONFIG_MTD_NAND_INTEL_LGM=y
>>
>> #
>> # Misc
>> #
>> CONFIG_MTD_NAND_NANDSIM=y
>> # CONFIG_MTD_NAND_DISKONCHIP is not set
>>
>> #
>> # ECC engine support
>> #
>> CONFIG_MTD_NAND_ECC=y
>> CONFIG_MTD_NAND_ECC_SW_HAMMING=y
>> # CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set
>> CONFIG_MTD_NAND_ECC_SW_BCH=y
>> CONFIG_MTD_NAND_ECC_MXIC=y
>> # end of ECC engine support
>> # end of NAND
>>
>> #
>> # LPDDR & LPDDR2 PCM memory drivers
>> #
>> # CONFIG_MTD_LPDDR is not set
>> # end of LPDDR & LPDDR2 PCM memory drivers
>>
>> CONFIG_MTD_UBI=y
>> CONFIG_MTD_UBI_WL_THRESHOLD=4096
>> CONFIG_MTD_UBI_BEB_LIMIT=20
>> # CONFIG_MTD_UBI_FASTMAP is not set
>> CONFIG_MTD_UBI_GLUEBI=y
>> # CONFIG_MTD_UBI_NVMEM is not set
>> # CONFIG_MTD_HYPERBUS is not set
>> CONFIG_DTC=y
>> CONFIG_OF=y
>> # CONFIG_OF_UNITTEST is not set
>> CONFIG_OF_KUNIT_TEST=y
>> CONFIG_OF_FLATTREE=y
>> CONFIG_OF_EARLY_FLATTREE=y
>> CONFIG_OF_KOBJ=y
>> CONFIG_OF_DYNAMIC=y
>> CONFIG_OF_ADDRESS=y
>> CONFIG_OF_IRQ=y
>> CONFIG_OF_RESERVED_MEM=y
>> CONFIG_OF_RESOLVE=y
>> CONFIG_OF_OVERLAY=y
>> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
>> CONFIG_PARPORT=y
>> CONFIG_PARPORT_PC=y
>> CONFIG_PARPORT_PC_FIFO=y
>> # CONFIG_PARPORT_PC_SUPERIO is not set
>> CONFIG_PARPORT_1284=y
>> CONFIG_PARPORT_NOT_PC=y
>>
>> #
>> # NVME Support
>> #
>> # end of NVME Support
>>
>> #
>> # Misc devices
>> #
>> CONFIG_AD525X_DPOT=y
>> CONFIG_AD525X_DPOT_I2C=y
>> CONFIG_DUMMY_IRQ=y
>> CONFIG_ICS932S401=y
>> # CONFIG_ENCLOSURE_SERVICES is not set
>> CONFIG_APDS9802ALS=y
>> CONFIG_ISL29003=y
>> # CONFIG_ISL29020 is not set
>> # CONFIG_SENSORS_TSL2550 is not set
>> CONFIG_SENSORS_BH1770=y
>> CONFIG_SENSORS_APDS990X=y
>> CONFIG_HMC6352=y
>> # CONFIG_DS1682 is not set
>> # CONFIG_SRAM is not set
>> # CONFIG_XILINX_SDFEC is not set
>> CONFIG_MISC_RTSX=y
>> CONFIG_HISI_HIKEY_USB=y
>> CONFIG_OPEN_DICE=y
>> CONFIG_VCPU_STALL_DETECTOR=y
>> # CONFIG_TPS6594_ESM is not set
>> CONFIG_TPS6594_PFSM=y
>> CONFIG_NSM=y
>> CONFIG_C2PORT=y
>> # CONFIG_C2PORT_DURAMAR_2150 is not set
>>
>> #
>> # EEPROM support
>> #
>> CONFIG_EEPROM_AT24=y
>> CONFIG_EEPROM_MAX6875=y
>> CONFIG_EEPROM_93CX6=y
>> CONFIG_EEPROM_IDT_89HPESX=y
>> CONFIG_EEPROM_EE1004=y
>> # end of EEPROM support
>>
>> #
>> # Texas Instruments shared transport line discipline
>> #
>> # end of Texas Instruments shared transport line discipline
>>
>> CONFIG_ALTERA_STAPL=y
>> CONFIG_ECHO=y
>> CONFIG_MISC_RTSX_USB=y
>> CONFIG_UACCE=y
>> CONFIG_PVPANIC=y
>> CONFIG_PVPANIC_MMIO=y
>> # end of Misc devices
>>
>> #
>> # SCSI device support
>> #
>> CONFIG_SCSI_LIB_KUNIT_TEST=y
>> # end of SCSI device support
>>
>> # CONFIG_MACINTOSH_DRIVERS is not set
>> CONFIG_NETDEVICES=y
>> # CONFIG_NET_CORE is not set
>> CONFIG_ATM_DRIVERS=y
>> CONFIG_ATM_DUMMY=y
>> # CONFIG_CAIF_DRIVERS is not set
>> # CONFIG_ETHERNET is not set
>> CONFIG_PHYLIB=y
>> CONFIG_SWPHY=y
>> CONFIG_PHYLIB_LEDS=y
>> CONFIG_FIXED_PHY=y
>>
>> #
>> # MII PHY device drivers
>> #
>> # CONFIG_AIR_EN8811H_PHY is not set
>> CONFIG_AMD_PHY=y
>> CONFIG_ADIN_PHY=y
>> # CONFIG_ADIN1100_PHY is not set
>> CONFIG_AQUANTIA_PHY=y
>> # CONFIG_AX88796B_PHY is not set
>> # CONFIG_BROADCOM_PHY is not set
>> # CONFIG_BCM54140_PHY is not set
>> # CONFIG_BCM7XXX_PHY is not set
>> CONFIG_BCM84881_PHY=y
>> CONFIG_BCM87XX_PHY=y
>> CONFIG_CICADA_PHY=y
>> CONFIG_CORTINA_PHY=y
>> # CONFIG_DAVICOM_PHY is not set
>> CONFIG_ICPLUS_PHY=y
>> CONFIG_LXT_PHY=y
>> CONFIG_INTEL_XWAY_PHY=y
>> CONFIG_LSI_ET1011C_PHY=y
>> CONFIG_MARVELL_PHY=y
>> CONFIG_MARVELL_10G_PHY=y
>> # CONFIG_MARVELL_88Q2XXX_PHY is not set
>> CONFIG_MARVELL_88X2222_PHY=y
>> # CONFIG_MAXLINEAR_GPHY is not set
>> CONFIG_MEDIATEK_GE_PHY=y
>> CONFIG_MICREL_PHY=y
>> CONFIG_MICROCHIP_T1S_PHY=y
>> CONFIG_MICROCHIP_PHY=y
>> # CONFIG_MICROCHIP_T1_PHY is not set
>> # CONFIG_MICROSEMI_PHY is not set
>> CONFIG_MOTORCOMM_PHY=y
>> CONFIG_NATIONAL_PHY=y
>> CONFIG_NXP_CBTX_PHY=y
>> CONFIG_NXP_C45_TJA11XX_PHY=y
>> CONFIG_NXP_TJA11XX_PHY=y
>> CONFIG_NCN26000_PHY=y
>> CONFIG_QCOM_NET_PHYLIB=y
>> # CONFIG_AT803X_PHY is not set
>> CONFIG_QCA83XX_PHY=y
>> CONFIG_QCA808X_PHY=y
>> # CONFIG_QCA807X_PHY is not set
>> # CONFIG_QSEMI_PHY is not set
>> # CONFIG_REALTEK_PHY is not set
>> # CONFIG_RENESAS_PHY is not set
>> CONFIG_ROCKCHIP_PHY=y
>> CONFIG_SMSC_PHY=y
>> # CONFIG_STE10XP is not set
>> CONFIG_TERANETICS_PHY=y
>> CONFIG_DP83822_PHY=y
>> # CONFIG_DP83TC811_PHY is not set
>> CONFIG_DP83848_PHY=y
>> # CONFIG_DP83867_PHY is not set
>> # CONFIG_DP83869_PHY is not set
>> CONFIG_DP83TD510_PHY=y
>> CONFIG_DP83TG720_PHY=y
>> CONFIG_VITESSE_PHY=y
>> # CONFIG_XILINX_GMII2RGMII is not set
>> CONFIG_PSE_CONTROLLER=y
>> # CONFIG_PSE_REGULATOR is not set
>> CONFIG_PSE_PD692X0=y
>> # CONFIG_PSE_TPS23881 is not set
>> CONFIG_CAN_DEV=y
>> # CONFIG_CAN_VCAN is not set
>> CONFIG_CAN_VXCAN=y
>> CONFIG_CAN_NETLINK=y
>> CONFIG_CAN_CALC_BITTIMING=y
>> CONFIG_CAN_RX_OFFLOAD=y
>> CONFIG_CAN_FLEXCAN=y
>> CONFIG_CAN_GRCAN=y
>> CONFIG_CAN_C_CAN=y
>> CONFIG_CAN_C_CAN_PLATFORM=y
>> # CONFIG_CAN_CC770 is not set
>> CONFIG_CAN_CTUCANFD=y
>> CONFIG_CAN_CTUCANFD_PLATFORM=y
>> # CONFIG_CAN_IFI_CANFD is not set
>> # CONFIG_CAN_M_CAN is not set
>> # CONFIG_CAN_SJA1000 is not set
>> CONFIG_CAN_SOFTING=y
>>
>> #
>> # CAN USB interfaces
>> #
>> # CONFIG_CAN_8DEV_USB is not set
>> CONFIG_CAN_EMS_USB=y
>> CONFIG_CAN_ESD_USB=y
>> CONFIG_CAN_ETAS_ES58X=y
>> CONFIG_CAN_F81604=y
>> CONFIG_CAN_GS_USB=y
>> CONFIG_CAN_KVASER_USB=y
>> # CONFIG_CAN_MCBA_USB is not set
>> CONFIG_CAN_PEAK_USB=y
>> CONFIG_CAN_UCAN=y
>> # end of CAN USB interfaces
>>
>> # CONFIG_CAN_DEBUG_DEVICES is not set
>> CONFIG_MDIO_DEVICE=y
>> CONFIG_MDIO_BUS=y
>> CONFIG_FWNODE_MDIO=y
>> CONFIG_OF_MDIO=y
>> CONFIG_MDIO_DEVRES=y
>> # CONFIG_MDIO_BITBANG is not set
>> # CONFIG_MDIO_BCM_UNIMAC is not set
>> CONFIG_MDIO_CAVIUM=y
>> # CONFIG_MDIO_HISI_FEMAC is not set
>> CONFIG_MDIO_MVUSB=y
>> # CONFIG_MDIO_MSCC_MIIM is not set
>> CONFIG_MDIO_OCTEON=y
>> # CONFIG_MDIO_IPQ4019 is not set
>> # CONFIG_MDIO_IPQ8064 is not set
>>
>> #
>> # MDIO Multiplexers
>> #
>> CONFIG_MDIO_BUS_MUX=y
>> CONFIG_MDIO_BUS_MUX_GPIO=y
>> # CONFIG_MDIO_BUS_MUX_MULTIPLEXER is not set
>> CONFIG_MDIO_BUS_MUX_MMIOREG=y
>>
>> #
>> # PCS device drivers
>> #
>> # end of PCS device drivers
>>
>> CONFIG_PLIP=y
>> CONFIG_PPP=y
>> CONFIG_PPP_BSDCOMP=y
>> CONFIG_PPP_DEFLATE=y
>> # CONFIG_PPP_FILTER is not set
>> CONFIG_PPP_MPPE=y
>> # CONFIG_PPP_MULTILINK is not set
>> CONFIG_PPPOATM=y
>> # CONFIG_PPPOE is not set
>> CONFIG_PPPOE_HASH_BITS=4
>> CONFIG_SLHC=y
>> # CONFIG_USB_NET_DRIVERS is not set
>> # CONFIG_WLAN is not set
>> # CONFIG_WAN is not set
>> CONFIG_IEEE802154_DRIVERS=y
>>
>> #
>> # Wireless WAN
>> #
>> CONFIG_WWAN=y
>> # CONFIG_WWAN_DEBUGFS is not set
>> # CONFIG_WWAN_HWSIM is not set
>> CONFIG_RPMSG_WWAN_CTRL=y
>> # end of Wireless WAN
>>
>> # CONFIG_HYPERV_NET is not set
>> # CONFIG_NET_FAILOVER is not set
>> CONFIG_ISDN=y
>> CONFIG_ISDN_CAPI=y
>> CONFIG_MISDN=y
>> CONFIG_MISDN_DSP=y
>> CONFIG_MISDN_L1OIP=y
>>
>> #
>> # mISDN hardware drivers
>> #
>> CONFIG_MISDN_HFCUSB=y
>>
>> #
>> # Input device support
>> #
>> # CONFIG_INPUT is not set
>>
>> #
>> # Hardware I/O ports
>> #
>> CONFIG_SERIO=y
>> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
>> CONFIG_SERIO_I8042=y
>> CONFIG_SERIO_CT82C710=y
>> CONFIG_SERIO_PARKBD=y
>> CONFIG_SERIO_LIBPS2=y
>> # CONFIG_SERIO_RAW is not set
>> # CONFIG_SERIO_ALTERA_PS2 is not set
>> # CONFIG_SERIO_PS2MULT is not set
>> CONFIG_SERIO_ARC_PS2=y
>> CONFIG_SERIO_APBPS2=y
>> CONFIG_HYPERV_KEYBOARD=y
>> CONFIG_SERIO_GPIO_PS2=y
>> # CONFIG_USERIO is not set
>> CONFIG_GAMEPORT=y
>> # end of Hardware I/O ports
>> # end of Input device support
>>
>> #
>> # Character devices
>> #
>> # CONFIG_TTY is not set
>> # CONFIG_SERIAL_DEV_BUS is not set
>> CONFIG_PRINTER=y
>> CONFIG_LP_CONSOLE=y
>> # CONFIG_PPDEV is not set
>> # CONFIG_IPMI_HANDLER is not set
>> # CONFIG_SSIF_IPMI_BMC is not set
>> # CONFIG_IPMB_DEVICE_INTERFACE is not set
>> CONFIG_HW_RANDOM=y
>> CONFIG_HW_RANDOM_TIMERIOMEM=y
>> # CONFIG_HW_RANDOM_BA431 is not set
>> CONFIG_HW_RANDOM_VIA=y
>> CONFIG_HW_RANDOM_VIRTIO=y
>> CONFIG_HW_RANDOM_CCTRNG=y
>> CONFIG_HW_RANDOM_XIPHERA=y
>> # CONFIG_DEVMEM is not set
>> CONFIG_NVRAM=y
>> CONFIG_DEVPORT=y
>> CONFIG_HANGCHECK_TIMER=y
>> CONFIG_TCG_TPM=y
>> CONFIG_TCG_TPM2_HMAC=y
>> CONFIG_HW_RANDOM_TPM=y
>> CONFIG_TCG_TIS_CORE=y
>> # CONFIG_TCG_TIS is not set
>> CONFIG_TCG_TIS_I2C=y
>> CONFIG_TCG_TIS_I2C_CR50=y
>> CONFIG_TCG_TIS_I2C_ATMEL=y
>> CONFIG_TCG_TIS_I2C_INFINEON=y
>> # CONFIG_TCG_TIS_I2C_NUVOTON is not set
>> # CONFIG_TCG_NSC is not set
>> CONFIG_TCG_ATMEL=y
>> CONFIG_TCG_VTPM_PROXY=y
>> CONFIG_TCG_TIS_ST33ZP24=y
>> CONFIG_TCG_TIS_ST33ZP24_I2C=y
>> CONFIG_TELCLOCK=y
>> CONFIG_XILLYBUS_CLASS=y
>> CONFIG_XILLYBUS=y
>> CONFIG_XILLYBUS_OF=y
>> # CONFIG_XILLYUSB is not set
>> # end of Character devices
>>
>> #
>> # I2C support
>> #
>> CONFIG_I2C=y
>> CONFIG_I2C_BOARDINFO=y
>> CONFIG_I2C_COMPAT=y
>> # CONFIG_I2C_CHARDEV is not set
>> CONFIG_I2C_MUX=y
>>
>> #
>> # Multiplexer I2C Chip support
>> #
>> CONFIG_I2C_ARB_GPIO_CHALLENGE=y
>> CONFIG_I2C_MUX_GPIO=y
>> CONFIG_I2C_MUX_GPMUX=y
>> CONFIG_I2C_MUX_LTC4306=y
>> CONFIG_I2C_MUX_PCA9541=y
>> # CONFIG_I2C_MUX_PCA954x is not set
>> # CONFIG_I2C_MUX_PINCTRL is not set
>> # CONFIG_I2C_MUX_REG is not set
>> # CONFIG_I2C_DEMUX_PINCTRL is not set
>> CONFIG_I2C_MUX_MLXCPLD=y
>> # end of Multiplexer I2C Chip support
>>
>> CONFIG_I2C_ATR=y
>> CONFIG_I2C_HELPER_AUTO=y
>> CONFIG_I2C_ALGOBIT=y
>>
>> #
>> # I2C Hardware Bus support
>> #
>>
>> #
>> # I2C system bus drivers (mostly embedded / system-on-chip)
>> #
>> CONFIG_I2C_CBUS_GPIO=y
>> CONFIG_I2C_DESIGNWARE_CORE=y
>> # CONFIG_I2C_DESIGNWARE_SLAVE is not set
>> CONFIG_I2C_DESIGNWARE_PLATFORM=y
>> # CONFIG_I2C_EMEV2 is not set
>> # CONFIG_I2C_GPIO is not set
>> CONFIG_I2C_KEMPLD=y
>> # CONFIG_I2C_OCORES is not set
>> # CONFIG_I2C_PCA_PLATFORM is not set
>> CONFIG_I2C_RK3X=y
>> CONFIG_I2C_SIMTEC=y
>> # CONFIG_I2C_XILINX is not set
>>
>> #
>> # External I2C/SMBus adapter drivers
>> #
>> CONFIG_I2C_DIOLAN_U2C=y
>> # CONFIG_I2C_DLN2 is not set
>> CONFIG_I2C_CP2615=y
>> # CONFIG_I2C_PARPORT is not set
>> # CONFIG_I2C_ROBOTFUZZ_OSIF is not set
>> CONFIG_I2C_TINY_USB=y
>> CONFIG_I2C_VIPERBOARD=y
>>
>> #
>> # Other I2C/SMBus bus drivers
>> #
>> # CONFIG_I2C_MLXCPLD is not set
>> CONFIG_I2C_VIRTIO=y
>> # end of I2C Hardware Bus support
>>
>> CONFIG_I2C_SLAVE=y
>> CONFIG_I2C_SLAVE_EEPROM=y
>> CONFIG_I2C_SLAVE_TESTUNIT=y
>> # CONFIG_I2C_DEBUG_CORE is not set
>> CONFIG_I2C_DEBUG_ALGO=y
>> # CONFIG_I2C_DEBUG_BUS is not set
>> # end of I2C support
>>
>> CONFIG_I3C=y
>> CONFIG_CDNS_I3C_MASTER=y
>> CONFIG_DW_I3C_MASTER=y
>> # CONFIG_SVC_I3C_MASTER is not set
>> CONFIG_MIPI_I3C_HCI=y
>> # CONFIG_SPI is not set
>> # CONFIG_SPMI is not set
>> CONFIG_HSI=y
>> CONFIG_HSI_BOARDINFO=y
>>
>> #
>> # HSI controllers
>> #
>>
>> #
>> # HSI clients
>> #
>> CONFIG_HSI_CHAR=y
>> # CONFIG_PPS is not set
>>
>> #
>> # PTP clock support
>> #
>> CONFIG_PTP_1588_CLOCK_OPTIONAL=y
>>
>> #
>> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
>> #
>> # end of PTP clock support
>>
>> CONFIG_PINCTRL=y
>> CONFIG_GENERIC_PINCTRL_GROUPS=y
>> CONFIG_PINMUX=y
>> CONFIG_GENERIC_PINMUX_FUNCTIONS=y
>> CONFIG_PINCONF=y
>> CONFIG_GENERIC_PINCONF=y
>> CONFIG_DEBUG_PINCTRL=y
>> CONFIG_PINCTRL_AS3722=y
>> CONFIG_PINCTRL_AXP209=y
>> # CONFIG_PINCTRL_AW9523 is not set
>> # CONFIG_PINCTRL_CY8C95X0 is not set
>> # CONFIG_PINCTRL_EQUILIBRIUM is not set
>> # CONFIG_PINCTRL_MAX77620 is not set
>> CONFIG_PINCTRL_MCP23S08_I2C=y
>> CONFIG_PINCTRL_MCP23S08=y
>> CONFIG_PINCTRL_MICROCHIP_SGPIO=y
>> CONFIG_PINCTRL_OCELOT=y
>> CONFIG_PINCTRL_PALMAS=y
>> CONFIG_PINCTRL_SINGLE=y
>> # CONFIG_PINCTRL_STMFX is not set
>> # CONFIG_PINCTRL_SX150X is not set
>> CONFIG_PINCTRL_TPS6594=y
>> # CONFIG_PINCTRL_CS42L43 is not set
>> CONFIG_PINCTRL_MADERA=y
>> CONFIG_PINCTRL_CS47L15=y
>> CONFIG_PINCTRL_CS47L35=y
>> CONFIG_PINCTRL_CS47L85=y
>> CONFIG_PINCTRL_CS47L90=y
>>
>> #
>> # Renesas pinctrl drivers
>> #
>> # end of Renesas pinctrl drivers
>>
>> CONFIG_GPIOLIB=y
>> CONFIG_GPIOLIB_FASTPATH_LIMIT=512
>> CONFIG_OF_GPIO=y
>> CONFIG_GPIOLIB_IRQCHIP=y
>> CONFIG_OF_GPIO_MM_GPIOCHIP=y
>> CONFIG_DEBUG_GPIO=y
>> CONFIG_GPIO_SYSFS=y
>> CONFIG_GPIO_CDEV=y
>> CONFIG_GPIO_CDEV_V1=y
>> CONFIG_GPIO_GENERIC=y
>> CONFIG_GPIO_REGMAP=y
>> CONFIG_GPIO_MAX730X=y
>>
>> #
>> # Memory mapped GPIO drivers
>> #
>> CONFIG_GPIO_74XX_MMIO=y
>> CONFIG_GPIO_ALTERA=y
>> # CONFIG_GPIO_CADENCE is not set
>> # CONFIG_GPIO_DWAPB is not set
>> CONFIG_GPIO_FTGPIO010=y
>> CONFIG_GPIO_GENERIC_PLATFORM=y
>> CONFIG_GPIO_GRANITERAPIDS=y
>> CONFIG_GPIO_GRGPIO=y
>> CONFIG_GPIO_HLWD=y
>> CONFIG_GPIO_LOGICVC=y
>> CONFIG_GPIO_MB86S7X=y
>> # CONFIG_GPIO_MENZ127 is not set
>> # CONFIG_GPIO_SIFIVE is not set
>> CONFIG_GPIO_SYSCON=y
>> CONFIG_GPIO_TANGIER=y
>> # CONFIG_GPIO_WCD934X is not set
>> CONFIG_GPIO_XILINX=y
>> CONFIG_GPIO_AMD_FCH=y
>> # end of Memory mapped GPIO drivers
>>
>> #
>> # Port-mapped I/O GPIO drivers
>> #
>> CONFIG_GPIO_I8255=y
>> CONFIG_GPIO_104_DIO_48E=y
>> # CONFIG_GPIO_104_IDIO_16 is not set
>> # CONFIG_GPIO_104_IDI_48 is not set
>> CONFIG_GPIO_F7188X=y
>> CONFIG_GPIO_GPIO_MM=y
>> # CONFIG_GPIO_IT87 is not set
>> CONFIG_GPIO_SCH311X=y
>> # CONFIG_GPIO_WINBOND is not set
>> # CONFIG_GPIO_WS16C48 is not set
>> # end of Port-mapped I/O GPIO drivers
>>
>> #
>> # I2C GPIO expanders
>> #
>> # CONFIG_GPIO_ADNP is not set
>> CONFIG_GPIO_FXL6408=y
>> # CONFIG_GPIO_DS4520 is not set
>> CONFIG_GPIO_GW_PLD=y
>> CONFIG_GPIO_MAX7300=y
>> CONFIG_GPIO_MAX732X=y
>> CONFIG_GPIO_MAX732X_IRQ=y
>> CONFIG_GPIO_PCA953X=y
>> CONFIG_GPIO_PCA953X_IRQ=y
>> CONFIG_GPIO_PCA9570=y
>> CONFIG_GPIO_PCF857X=y
>> # CONFIG_GPIO_TPIC2810 is not set
>> # end of I2C GPIO expanders
>>
>> #
>> # MFD GPIO expanders
>> #
>> # CONFIG_GPIO_ARIZONA is not set
>> # CONFIG_GPIO_BD71815 is not set
>> CONFIG_GPIO_BD71828=y
>> CONFIG_GPIO_BD9571MWV=y
>> CONFIG_GPIO_DA9055=y
>> CONFIG_GPIO_DLN2=y
>> CONFIG_GPIO_ELKHARTLAKE=y
>> # CONFIG_GPIO_KEMPLD is not set
>> CONFIG_GPIO_LP3943=y
>> CONFIG_GPIO_LP873X=y
>> CONFIG_GPIO_LP87565=y
>> CONFIG_GPIO_MADERA=y
>> # CONFIG_GPIO_MAX77620 is not set
>> CONFIG_GPIO_MAX77650=y
>> # CONFIG_GPIO_PALMAS is not set
>> CONFIG_GPIO_STMPE=y
>> CONFIG_GPIO_TC3589X=y
>> # CONFIG_GPIO_TPS65218 is not set
>> CONFIG_GPIO_TPS65910=y
>> CONFIG_GPIO_TPS65912=y
>> CONFIG_GPIO_WM8350=y
>> # end of MFD GPIO expanders
>>
>> #
>> # USB GPIO expanders
>> #
>> # CONFIG_GPIO_VIPERBOARD is not set
>> # end of USB GPIO expanders
>>
>> #
>> # Virtual GPIO drivers
>> #
>> CONFIG_GPIO_AGGREGATOR=y
>> CONFIG_GPIO_LATCH=y
>> CONFIG_GPIO_MOCKUP=y
>> CONFIG_GPIO_VIRTIO=y
>> # CONFIG_GPIO_SIM is not set
>> # end of Virtual GPIO drivers
>>
>> CONFIG_W1=y
>> CONFIG_W1_CON=y
>>
>> #
>> # 1-wire Bus Masters
>> #
>> CONFIG_W1_MASTER_AMD_AXI=y
>> # CONFIG_W1_MASTER_DS2490 is not set
>> CONFIG_W1_MASTER_DS2482=y
>> CONFIG_W1_MASTER_GPIO=y
>> # CONFIG_W1_MASTER_SGI is not set
>> # end of 1-wire Bus Masters
>>
>> #
>> # 1-wire Slaves
>> #
>> # CONFIG_W1_SLAVE_THERM is not set
>> CONFIG_W1_SLAVE_SMEM=y
>> CONFIG_W1_SLAVE_DS2405=y
>> CONFIG_W1_SLAVE_DS2408=y
>> # CONFIG_W1_SLAVE_DS2408_READBACK is not set
>> # CONFIG_W1_SLAVE_DS2413 is not set
>> CONFIG_W1_SLAVE_DS2406=y
>> CONFIG_W1_SLAVE_DS2423=y
>> # CONFIG_W1_SLAVE_DS2805 is not set
>> # CONFIG_W1_SLAVE_DS2430 is not set
>> # CONFIG_W1_SLAVE_DS2431 is not set
>> CONFIG_W1_SLAVE_DS2433=y
>> # CONFIG_W1_SLAVE_DS2433_CRC is not set
>> CONFIG_W1_SLAVE_DS2438=y
>> CONFIG_W1_SLAVE_DS250X=y
>> CONFIG_W1_SLAVE_DS2780=y
>> # CONFIG_W1_SLAVE_DS2781 is not set
>> # CONFIG_W1_SLAVE_DS28E04 is not set
>> CONFIG_W1_SLAVE_DS28E17=y
>> # end of 1-wire Slaves
>>
>> # CONFIG_POWER_RESET is not set
>> # CONFIG_POWER_SUPPLY is not set
>> CONFIG_HWMON=y
>> CONFIG_HWMON_VID=y
>> # CONFIG_HWMON_DEBUG_CHIP is not set
>>
>> #
>> # Native drivers
>> #
>> CONFIG_SENSORS_AD7414=y
>> CONFIG_SENSORS_AD7418=y
>> # CONFIG_SENSORS_ADM1025 is not set
>> CONFIG_SENSORS_ADM1026=y
>> CONFIG_SENSORS_ADM1029=y
>> CONFIG_SENSORS_ADM1031=y
>> CONFIG_SENSORS_ADM1177=y
>> # CONFIG_SENSORS_ADM9240 is not set
>> # CONFIG_SENSORS_ADT7410 is not set
>> CONFIG_SENSORS_ADT7411=y
>> CONFIG_SENSORS_ADT7462=y
>> CONFIG_SENSORS_ADT7470=y
>> # CONFIG_SENSORS_ADT7475 is not set
>> CONFIG_SENSORS_AHT10=y
>> # CONFIG_SENSORS_AS370 is not set
>> CONFIG_SENSORS_ASC7621=y
>> CONFIG_SENSORS_AXI_FAN_CONTROL=y
>> CONFIG_SENSORS_ASB100=y
>> CONFIG_SENSORS_ATXP1=y
>> # CONFIG_SENSORS_CHIPCAP2 is not set
>> CONFIG_SENSORS_DS620=y
>> CONFIG_SENSORS_DS1621=y
>> CONFIG_SENSORS_DA9055=y
>> CONFIG_SENSORS_F71805F=y
>> CONFIG_SENSORS_F71882FG=y
>> # CONFIG_SENSORS_F75375S is not set
>> # CONFIG_SENSORS_GSC is not set
>> CONFIG_SENSORS_MC13783_ADC=y
>> CONFIG_SENSORS_FSCHMD=y
>> # CONFIG_SENSORS_GL518SM is not set
>> CONFIG_SENSORS_GL520SM=y
>> CONFIG_SENSORS_G760A=y
>> CONFIG_SENSORS_G762=y
>> CONFIG_SENSORS_GPIO_FAN=y
>> # CONFIG_SENSORS_HIH6130 is not set
>> # CONFIG_SENSORS_HS3001 is not set
>> CONFIG_SENSORS_CORETEMP=y
>> CONFIG_SENSORS_IT87=y
>> CONFIG_SENSORS_JC42=y
>> CONFIG_SENSORS_POWERZ=y
>> # CONFIG_SENSORS_POWR1220 is not set
>> CONFIG_SENSORS_LENOVO_EC=y
>> CONFIG_SENSORS_LINEAGE=y
>> # CONFIG_SENSORS_LTC2945 is not set
>> CONFIG_SENSORS_LTC2947=y
>> CONFIG_SENSORS_LTC2947_I2C=y
>> CONFIG_SENSORS_LTC2990=y
>> # CONFIG_SENSORS_LTC2991 is not set
>> CONFIG_SENSORS_LTC2992=y
>> CONFIG_SENSORS_LTC4151=y
>> CONFIG_SENSORS_LTC4215=y
>> CONFIG_SENSORS_LTC4222=y
>> CONFIG_SENSORS_LTC4245=y
>> # CONFIG_SENSORS_LTC4260 is not set
>> CONFIG_SENSORS_LTC4261=y
>> CONFIG_SENSORS_LTC4282=y
>> # CONFIG_SENSORS_MAX127 is not set
>> # CONFIG_SENSORS_MAX16065 is not set
>> # CONFIG_SENSORS_MAX1619 is not set
>> # CONFIG_SENSORS_MAX1668 is not set
>> CONFIG_SENSORS_MAX197=y
>> # CONFIG_SENSORS_MAX31730 is not set
>> CONFIG_SENSORS_MAX31760=y
>> # CONFIG_MAX31827 is not set
>> # CONFIG_SENSORS_MAX6620 is not set
>> CONFIG_SENSORS_MAX6621=y
>> CONFIG_SENSORS_MAX6639=y
>> # CONFIG_SENSORS_MAX6650 is not set
>> CONFIG_SENSORS_MAX6697=y
>> CONFIG_SENSORS_MAX31790=y
>> CONFIG_SENSORS_MC34VR500=y
>> CONFIG_SENSORS_MCP3021=y
>> # CONFIG_SENSORS_MLXREG_FAN is not set
>> # CONFIG_SENSORS_TC654 is not set
>> # CONFIG_SENSORS_TPS23861 is not set
>> CONFIG_SENSORS_MENF21BMC_HWMON=y
>> # CONFIG_SENSORS_MR75203 is not set
>> CONFIG_SENSORS_LM63=y
>> # CONFIG_SENSORS_LM73 is not set
>> CONFIG_SENSORS_LM75=y
>> CONFIG_SENSORS_LM77=y
>> # CONFIG_SENSORS_LM78 is not set
>> CONFIG_SENSORS_LM80=y
>> # CONFIG_SENSORS_LM83 is not set
>> CONFIG_SENSORS_LM85=y
>> CONFIG_SENSORS_LM87=y
>> CONFIG_SENSORS_LM90=y
>> # CONFIG_SENSORS_LM92 is not set
>> CONFIG_SENSORS_LM93=y
>> CONFIG_SENSORS_LM95234=y
>> CONFIG_SENSORS_LM95241=y
>> CONFIG_SENSORS_LM95245=y
>> # CONFIG_SENSORS_PC87360 is not set
>> # CONFIG_SENSORS_PC87427 is not set
>> # CONFIG_SENSORS_NCT6683 is not set
>> CONFIG_SENSORS_NCT6775_CORE=y
>> # CONFIG_SENSORS_NCT6775 is not set
>> CONFIG_SENSORS_NCT6775_I2C=y
>> CONFIG_SENSORS_NCT7802=y
>> # CONFIG_SENSORS_NPCM7XX is not set
>> # CONFIG_SENSORS_OCC_P8_I2C is not set
>> CONFIG_SENSORS_PCF8591=y
>> # CONFIG_PMBUS is not set
>> CONFIG_SENSORS_PT5161L=y
>> CONFIG_SENSORS_SBTSI=y
>> # CONFIG_SENSORS_SBRMI is not set
>> # CONFIG_SENSORS_SHT15 is not set
>> CONFIG_SENSORS_SHT21=y
>> # CONFIG_SENSORS_SHT3x is not set
>> # CONFIG_SENSORS_SHT4x is not set
>> CONFIG_SENSORS_SHTC1=y
>> CONFIG_SENSORS_DME1737=y
>> CONFIG_SENSORS_EMC1403=y
>> CONFIG_SENSORS_EMC2103=y
>> # CONFIG_SENSORS_EMC2305 is not set
>> CONFIG_SENSORS_EMC6W201=y
>> CONFIG_SENSORS_SMSC47M1=y
>> # CONFIG_SENSORS_SMSC47M192 is not set
>> CONFIG_SENSORS_SMSC47B397=y
>> CONFIG_SENSORS_STTS751=y
>> CONFIG_SENSORS_ADC128D818=y
>> CONFIG_SENSORS_ADS7828=y
>> # CONFIG_SENSORS_AMC6821 is not set
>> CONFIG_SENSORS_INA209=y
>> CONFIG_SENSORS_INA2XX=y
>> CONFIG_SENSORS_INA238=y
>> # CONFIG_SENSORS_INA3221 is not set
>> CONFIG_SENSORS_TC74=y
>> # CONFIG_SENSORS_THMC50 is not set
>> # CONFIG_SENSORS_TMP102 is not set
>> CONFIG_SENSORS_TMP103=y
>> CONFIG_SENSORS_TMP108=y
>> # CONFIG_SENSORS_TMP401 is not set
>> # CONFIG_SENSORS_TMP421 is not set
>> # CONFIG_SENSORS_TMP464 is not set
>> CONFIG_SENSORS_TMP513=y
>> CONFIG_SENSORS_VIA_CPUTEMP=y
>> CONFIG_SENSORS_VT1211=y
>> # CONFIG_SENSORS_W83773G is not set
>> # CONFIG_SENSORS_W83781D is not set
>> # CONFIG_SENSORS_W83791D is not set
>> CONFIG_SENSORS_W83792D=y
>> CONFIG_SENSORS_W83793=y
>> CONFIG_SENSORS_W83795=y
>> CONFIG_SENSORS_W83795_FANCTRL=y
>> CONFIG_SENSORS_W83L785TS=y
>> CONFIG_SENSORS_W83L786NG=y
>> # CONFIG_SENSORS_W83627HF is not set
>> # CONFIG_SENSORS_W83627EHF is not set
>> CONFIG_SENSORS_WM8350=y
>> # CONFIG_SENSORS_INTEL_M10_BMC_HWMON is not set
>> CONFIG_THERMAL=y
>> CONFIG_THERMAL_NETLINK=y
>> CONFIG_THERMAL_STATISTICS=y
>> CONFIG_THERMAL_DEBUGFS=y
>> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
>> # CONFIG_THERMAL_HWMON is not set
>> CONFIG_THERMAL_OF=y
>> # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
>> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
>> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
>> CONFIG_THERMAL_DEFAULT_GOV_BANG_BANG=y
>> CONFIG_THERMAL_GOV_FAIR_SHARE=y
>> CONFIG_THERMAL_GOV_STEP_WISE=y
>> CONFIG_THERMAL_GOV_BANG_BANG=y
>> CONFIG_THERMAL_GOV_USER_SPACE=y
>> CONFIG_CPU_THERMAL=y
>> # CONFIG_THERMAL_EMULATION is not set
>> # CONFIG_THERMAL_MMIO is not set
>> CONFIG_MAX77620_THERMAL=y
>>
>> #
>> # Intel thermal drivers
>> #
>> CONFIG_X86_THERMAL_VECTOR=y
>> CONFIG_INTEL_TCC=y
>> CONFIG_X86_PKG_TEMP_THERMAL=y
>>
>> #
>> # ACPI INT340X thermal drivers
>> #
>> # end of ACPI INT340X thermal drivers
>>
>> # CONFIG_INTEL_TCC_COOLING is not set
>> # CONFIG_INTEL_HFI_THERMAL is not set
>> # end of Intel thermal drivers
>>
>> # CONFIG_WATCHDOG is not set
>> CONFIG_SSB_POSSIBLE=y
>> CONFIG_SSB=y
>> CONFIG_SSB_SDIOHOST_POSSIBLE=y
>> CONFIG_SSB_SDIOHOST=y
>> # CONFIG_SSB_DRIVER_GPIO is not set
>> CONFIG_BCMA_POSSIBLE=y
>> CONFIG_BCMA=y
>> CONFIG_BCMA_HOST_SOC=y
>> CONFIG_BCMA_SFLASH=y
>> # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
>> CONFIG_BCMA_DRIVER_GPIO=y
>> # CONFIG_BCMA_DEBUG is not set
>>
>> #
>> # Multifunction device drivers
>> #
>> CONFIG_MFD_CORE=y
>> CONFIG_MFD_ACT8945A=y
>> CONFIG_MFD_AS3711=y
>> # CONFIG_MFD_SMPRO is not set
>> CONFIG_MFD_AS3722=y
>> # CONFIG_PMIC_ADP5520 is not set
>> # CONFIG_MFD_AAT2870_CORE is not set
>> # CONFIG_MFD_ATMEL_FLEXCOM is not set
>> CONFIG_MFD_ATMEL_HLCDC=y
>> # CONFIG_MFD_BCM590XX is not set
>> CONFIG_MFD_BD9571MWV=y
>> CONFIG_MFD_AXP20X=y
>> CONFIG_MFD_AXP20X_I2C=y
>> CONFIG_MFD_CS42L43=y
>> # CONFIG_MFD_CS42L43_I2C is not set
>> CONFIG_MFD_CS42L43_SDW=y
>> CONFIG_MFD_MADERA=y
>> CONFIG_MFD_MADERA_I2C=y
>> CONFIG_MFD_MAX5970=y
>> CONFIG_MFD_CS47L15=y
>> CONFIG_MFD_CS47L35=y
>> CONFIG_MFD_CS47L85=y
>> CONFIG_MFD_CS47L90=y
>> # CONFIG_MFD_CS47L92 is not set
>> CONFIG_PMIC_DA903X=y
>> # CONFIG_MFD_DA9052_I2C is not set
>> CONFIG_MFD_DA9055=y
>> # CONFIG_MFD_DA9062 is not set
>> CONFIG_MFD_DA9063=y
>> CONFIG_MFD_DA9150=y
>> CONFIG_MFD_DLN2=y
>> CONFIG_MFD_GATEWORKS_GSC=y
>> CONFIG_MFD_MC13XXX=y
>> CONFIG_MFD_MC13XXX_I2C=y
>> CONFIG_MFD_MP2629=y
>> CONFIG_MFD_HI6421_PMIC=y
>> CONFIG_MFD_IQS62X=y
>> CONFIG_MFD_KEMPLD=y
>> # CONFIG_MFD_88PM800 is not set
>> # CONFIG_MFD_88PM805 is not set
>> # CONFIG_MFD_88PM860X is not set
>> # CONFIG_MFD_MAX14577 is not set
>> CONFIG_MFD_MAX77541=y
>> CONFIG_MFD_MAX77620=y
>> CONFIG_MFD_MAX77650=y
>> CONFIG_MFD_MAX77686=y
>> CONFIG_MFD_MAX77693=y
>> CONFIG_MFD_MAX77714=y
>> CONFIG_MFD_MAX77843=y
>> # CONFIG_MFD_MAX8907 is not set
>> # CONFIG_MFD_MAX8925 is not set
>> # CONFIG_MFD_MAX8997 is not set
>> # CONFIG_MFD_MAX8998 is not set
>> CONFIG_MFD_MT6360=y
>> # CONFIG_MFD_MT6370 is not set
>> CONFIG_MFD_MT6397=y
>> CONFIG_MFD_MENF21BMC=y
>> CONFIG_MFD_VIPERBOARD=y
>> # CONFIG_MFD_NTXEC is not set
>> CONFIG_MFD_RETU=y
>> CONFIG_MFD_PCF50633=y
>> CONFIG_PCF50633_ADC=y
>> # CONFIG_PCF50633_GPIO is not set
>> # CONFIG_MFD_SY7636A is not set
>> CONFIG_MFD_RT4831=y
>> CONFIG_MFD_RT5033=y
>> # CONFIG_MFD_RT5120 is not set
>> # CONFIG_MFD_RC5T583 is not set
>> # CONFIG_MFD_RK8XX_I2C is not set
>> CONFIG_MFD_RN5T618=y
>> CONFIG_MFD_SEC_CORE=y
>> CONFIG_MFD_SI476X_CORE=y
>> CONFIG_MFD_SIMPLE_MFD_I2C=y
>> CONFIG_MFD_SM501=y
>> CONFIG_MFD_SM501_GPIO=y
>> CONFIG_MFD_SKY81452=y
>> CONFIG_MFD_STMPE=y
>>
>> #
>> # STMicroelectronics STMPE Interface Drivers
>> #
>> CONFIG_STMPE_I2C=y
>> # end of STMicroelectronics STMPE Interface Drivers
>>
>> CONFIG_MFD_SYSCON=y
>> CONFIG_MFD_LP3943=y
>> # CONFIG_MFD_LP8788 is not set
>> CONFIG_MFD_TI_LMU=y
>> CONFIG_MFD_PALMAS=y
>> CONFIG_TPS6105X=y
>> # CONFIG_TPS65010 is not set
>> CONFIG_TPS6507X=y
>> # CONFIG_MFD_TPS65086 is not set
>> # CONFIG_MFD_TPS65090 is not set
>> # CONFIG_MFD_TPS65217 is not set
>> CONFIG_MFD_TI_LP873X=y
>> CONFIG_MFD_TI_LP87565=y
>> CONFIG_MFD_TPS65218=y
>> # CONFIG_MFD_TPS65219 is not set
>> # CONFIG_MFD_TPS6586X is not set
>> CONFIG_MFD_TPS65910=y
>> CONFIG_MFD_TPS65912=y
>> CONFIG_MFD_TPS65912_I2C=y
>> CONFIG_MFD_TPS6594=y
>> CONFIG_MFD_TPS6594_I2C=y
>> # CONFIG_TWL4030_CORE is not set
>> # CONFIG_TWL6040_CORE is not set
>> # CONFIG_MFD_WL1273_CORE is not set
>> CONFIG_MFD_LM3533=y
>> CONFIG_MFD_TC3589X=y
>> # CONFIG_MFD_TQMX86 is not set
>> # CONFIG_MFD_LOCHNAGAR is not set
>> CONFIG_MFD_ARIZONA=y
>> CONFIG_MFD_ARIZONA_I2C=y
>> CONFIG_MFD_CS47L24=y
>> # CONFIG_MFD_WM5102 is not set
>> CONFIG_MFD_WM5110=y
>> CONFIG_MFD_WM8997=y
>> CONFIG_MFD_WM8998=y
>> # CONFIG_MFD_WM8400 is not set
>> # CONFIG_MFD_WM831X_I2C is not set
>> CONFIG_MFD_WM8350=y
>> CONFIG_MFD_WM8350_I2C=y
>> # CONFIG_MFD_WM8994 is not set
>> CONFIG_MFD_ROHM_BD718XX=y
>> CONFIG_MFD_ROHM_BD71828=y
>> CONFIG_MFD_ROHM_BD957XMUF=y
>> CONFIG_MFD_STPMIC1=y
>> # CONFIG_MFD_STMFX is not set
>> CONFIG_MFD_WCD934X=y
>> CONFIG_MFD_ATC260X=y
>> CONFIG_MFD_ATC260X_I2C=y
>> # CONFIG_MFD_QCOM_PM8008 is not set
>> CONFIG_MFD_INTEL_M10_BMC_CORE=y
>> CONFIG_MFD_INTEL_M10_BMC_PMCI=y
>> CONFIG_MFD_RSMU_I2C=y
>> # end of Multifunction device drivers
>>
>> CONFIG_REGULATOR=y
>> CONFIG_REGULATOR_DEBUG=y
>> CONFIG_REGULATOR_FIXED_VOLTAGE=y
>> CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
>> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
>> CONFIG_REGULATOR_NETLINK_EVENTS=y
>> CONFIG_REGULATOR_88PG86X=y
>> # CONFIG_REGULATOR_ACT8945A is not set
>> # CONFIG_REGULATOR_AD5398 is not set
>> CONFIG_REGULATOR_AS3711=y
>> CONFIG_REGULATOR_AS3722=y
>> # CONFIG_REGULATOR_ATC260X is not set
>> # CONFIG_REGULATOR_AW37503 is not set
>> CONFIG_REGULATOR_AXP20X=y
>> CONFIG_REGULATOR_BD71815=y
>> CONFIG_REGULATOR_BD71828=y
>> # CONFIG_REGULATOR_BD718XX is not set
>> CONFIG_REGULATOR_BD9571MWV=y
>> # CONFIG_REGULATOR_BD957XMUF is not set
>> CONFIG_REGULATOR_DA903X=y
>> # CONFIG_REGULATOR_DA9055 is not set
>> CONFIG_REGULATOR_DA9063=y
>> CONFIG_REGULATOR_DA9121=y
>> CONFIG_REGULATOR_DA9210=y
>> CONFIG_REGULATOR_DA9211=y
>> CONFIG_REGULATOR_FAN53555=y
>> CONFIG_REGULATOR_FAN53880=y
>> CONFIG_REGULATOR_GPIO=y
>> # CONFIG_REGULATOR_HI6421 is not set
>> CONFIG_REGULATOR_HI6421V530=y
>> CONFIG_REGULATOR_ISL9305=y
>> CONFIG_REGULATOR_ISL6271A=y
>> # CONFIG_REGULATOR_LM363X is not set
>> CONFIG_REGULATOR_LP3971=y
>> CONFIG_REGULATOR_LP3972=y
>> # CONFIG_REGULATOR_LP872X is not set
>> CONFIG_REGULATOR_LP873X=y
>> CONFIG_REGULATOR_LP8755=y
>> # CONFIG_REGULATOR_LP87565 is not set
>> # CONFIG_REGULATOR_LTC3589 is not set
>> CONFIG_REGULATOR_LTC3676=y
>> # CONFIG_REGULATOR_MAX1586 is not set
>> CONFIG_REGULATOR_MAX5970=y
>> # CONFIG_REGULATOR_MAX77503 is not set
>> CONFIG_REGULATOR_MAX77541=y
>> # CONFIG_REGULATOR_MAX77620 is not set
>> CONFIG_REGULATOR_MAX77650=y
>> CONFIG_REGULATOR_MAX77857=y
>> # CONFIG_REGULATOR_MAX8649 is not set
>> CONFIG_REGULATOR_MAX8660=y
>> # CONFIG_REGULATOR_MAX8893 is not set
>> CONFIG_REGULATOR_MAX8952=y
>> CONFIG_REGULATOR_MAX8973=y
>> CONFIG_REGULATOR_MAX20086=y
>> CONFIG_REGULATOR_MAX20411=y
>> CONFIG_REGULATOR_MAX77686=y
>> CONFIG_REGULATOR_MAX77693=y
>> # CONFIG_REGULATOR_MAX77802 is not set
>> CONFIG_REGULATOR_MAX77826=y
>> # CONFIG_REGULATOR_MC13783 is not set
>> # CONFIG_REGULATOR_MC13892 is not set
>> # CONFIG_REGULATOR_MCP16502 is not set
>> CONFIG_REGULATOR_MP5416=y
>> CONFIG_REGULATOR_MP8859=y
>> CONFIG_REGULATOR_MP886X=y
>> CONFIG_REGULATOR_MPQ7920=y
>> CONFIG_REGULATOR_MT6311=y
>> CONFIG_REGULATOR_MT6323=y
>> CONFIG_REGULATOR_MT6331=y
>> CONFIG_REGULATOR_MT6332=y
>> CONFIG_REGULATOR_MT6357=y
>> CONFIG_REGULATOR_MT6358=y
>> # CONFIG_REGULATOR_MT6359 is not set
>> CONFIG_REGULATOR_MT6360=y
>> CONFIG_REGULATOR_MT6397=y
>> # CONFIG_REGULATOR_PALMAS is not set
>> CONFIG_REGULATOR_PCA9450=y
>> CONFIG_REGULATOR_PCF50633=y
>> # CONFIG_REGULATOR_PF8X00 is not set
>> CONFIG_REGULATOR_PFUZE100=y
>> # CONFIG_REGULATOR_PV88060 is not set
>> # CONFIG_REGULATOR_PV88080 is not set
>> # CONFIG_REGULATOR_PV88090 is not set
>> CONFIG_REGULATOR_RAA215300=y
>> CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=y
>> # CONFIG_REGULATOR_RN5T618 is not set
>> CONFIG_REGULATOR_ROHM=y
>> # CONFIG_REGULATOR_RT4801 is not set
>> CONFIG_REGULATOR_RT4803=y
>> # CONFIG_REGULATOR_RT4831 is not set
>> # CONFIG_REGULATOR_RT5033 is not set
>> CONFIG_REGULATOR_RT5190A=y
>> CONFIG_REGULATOR_RT5739=y
>> CONFIG_REGULATOR_RT5759=y
>> CONFIG_REGULATOR_RT6160=y
>> # CONFIG_REGULATOR_RT6190 is not set
>> # CONFIG_REGULATOR_RT6245 is not set
>> # CONFIG_REGULATOR_RTQ2134 is not set
>> # CONFIG_REGULATOR_RTMV20 is not set
>> CONFIG_REGULATOR_RTQ6752=y
>> CONFIG_REGULATOR_RTQ2208=y
>> CONFIG_REGULATOR_S2MPA01=y
>> # CONFIG_REGULATOR_S2MPS11 is not set
>> CONFIG_REGULATOR_S5M8767=y
>> CONFIG_REGULATOR_SKY81452=y
>> CONFIG_REGULATOR_SLG51000=y
>> CONFIG_REGULATOR_STPMIC1=y
>> CONFIG_REGULATOR_SY8106A=y
>> # CONFIG_REGULATOR_SY8824X is not set
>> CONFIG_REGULATOR_SY8827N=y
>> CONFIG_REGULATOR_TPS51632=y
>> # CONFIG_REGULATOR_TPS6105X is not set
>> CONFIG_REGULATOR_TPS62360=y
>> CONFIG_REGULATOR_TPS6286X=y
>> # CONFIG_REGULATOR_TPS6287X is not set
>> CONFIG_REGULATOR_TPS65023=y
>> CONFIG_REGULATOR_TPS6507X=y
>> CONFIG_REGULATOR_TPS65132=y
>> CONFIG_REGULATOR_TPS65218=y
>> CONFIG_REGULATOR_TPS6594=y
>> CONFIG_REGULATOR_TPS65910=y
>> CONFIG_REGULATOR_TPS65912=y
>> CONFIG_REGULATOR_VCTRL=y
>> CONFIG_REGULATOR_WM8350=y
>> CONFIG_CEC_CORE=y
>>
>> #
>> # CEC support
>> #
>> CONFIG_MEDIA_CEC_SUPPORT=y
>> CONFIG_CEC_CH7322=y
>> # CONFIG_CEC_GPIO is not set
>> # end of CEC support
>>
>> CONFIG_MEDIA_SUPPORT=y
>> CONFIG_MEDIA_SUPPORT_FILTER=y
>> # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
>>
>> #
>> # Media device types
>> #
>> CONFIG_MEDIA_CAMERA_SUPPORT=y
>> # CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
>> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
>> # CONFIG_MEDIA_RADIO_SUPPORT is not set
>> CONFIG_MEDIA_SDR_SUPPORT=y
>> # CONFIG_MEDIA_PLATFORM_SUPPORT is not set
>> CONFIG_MEDIA_TEST_SUPPORT=y
>> # end of Media device types
>>
>> CONFIG_VIDEO_DEV=y
>> CONFIG_MEDIA_CONTROLLER=y
>> CONFIG_DVB_CORE=y
>>
>> #
>> # Video4Linux options
>> #
>> CONFIG_VIDEO_V4L2_I2C=y
>> CONFIG_VIDEO_V4L2_SUBDEV_API=y
>> # CONFIG_VIDEO_ADV_DEBUG is not set
>> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
>> CONFIG_VIDEO_TUNER=y
>> CONFIG_V4L2_FWNODE=y
>> CONFIG_V4L2_ASYNC=y
>> CONFIG_V4L2_CCI=y
>> CONFIG_V4L2_CCI_I2C=y
>> # end of Video4Linux options
>>
>> #
>> # Media controller options
>> #
>> # CONFIG_MEDIA_CONTROLLER_DVB is not set
>> # end of Media controller options
>>
>> #
>> # Digital TV options
>> #
>> CONFIG_DVB_MMAP=y
>> CONFIG_DVB_MAX_ADAPTERS=16
>> # CONFIG_DVB_DYNAMIC_MINORS is not set
>> CONFIG_DVB_DEMUX_SECTION_LOSS_LOG=y
>> CONFIG_DVB_ULE_DEBUG=y
>> # end of Digital TV options
>>
>> #
>> # Media drivers
>> #
>>
>> #
>> # Drivers filtered as selected at 'Filter media drivers'
>> #
>>
>> #
>> # Media drivers
>> #
>> CONFIG_MEDIA_USB_SUPPORT=y
>>
>> #
>> # Webcam devices
>> #
>> # CONFIG_USB_GSPCA is not set
>> CONFIG_USB_PWC=y
>> # CONFIG_USB_PWC_DEBUG is not set
>> CONFIG_USB_S2255=y
>> # CONFIG_USB_VIDEO_CLASS is not set
>>
>> #
>> # Analog/digital TV USB devices
>> #
>> CONFIG_VIDEO_CX231XX=y
>> CONFIG_VIDEO_CX231XX_DVB=y
>>
>> #
>> # Digital TV USB devices
>> #
>> # CONFIG_DVB_B2C2_FLEXCOP_USB is not set
>> CONFIG_DVB_USB_V2=y
>> # CONFIG_DVB_USB_AF9015 is not set
>> # CONFIG_DVB_USB_AF9035 is not set
>> CONFIG_DVB_USB_ANYSEE=y
>> CONFIG_DVB_USB_AU6610=y
>> CONFIG_DVB_USB_AZ6007=y
>> # CONFIG_DVB_USB_CE6230 is not set
>> CONFIG_DVB_USB_DVBSKY=y
>> # CONFIG_DVB_USB_EC168 is not set
>> CONFIG_DVB_USB_GL861=y
>> # CONFIG_DVB_USB_MXL111SF is not set
>> # CONFIG_DVB_USB_RTL28XXU is not set
>> CONFIG_DVB_USB_ZD1301=y
>> CONFIG_SMS_USB_DRV=y
>>
>> #
>> # Webcam, TV (analog/digital) USB devices
>> #
>> CONFIG_VIDEO_EM28XX=y
>> CONFIG_VIDEO_EM28XX_V4L2=y
>> # CONFIG_VIDEO_EM28XX_DVB is not set
>>
>> #
>> # Software defined radio USB devices
>> #
>> CONFIG_USB_AIRSPY=y
>> CONFIG_USB_HACKRF=y
>> # CONFIG_V4L_TEST_DRIVERS is not set
>> # CONFIG_DVB_TEST_DRIVERS is not set
>> CONFIG_MEDIA_COMMON_OPTIONS=y
>>
>> #
>> # common driver options
>> #
>> CONFIG_CYPRESS_FIRMWARE=y
>> CONFIG_VIDEO_CX2341X=y
>> CONFIG_VIDEO_TVEEPROM=y
>> CONFIG_SMS_SIANO_MDTV=y
>> CONFIG_VIDEOBUF2_CORE=y
>> CONFIG_VIDEOBUF2_V4L2=y
>> CONFIG_VIDEOBUF2_MEMOPS=y
>> CONFIG_VIDEOBUF2_VMALLOC=y
>> # end of Media drivers
>>
>> #
>> # Media ancillary drivers
>> #
>> # CONFIG_VIDEO_CAMERA_SENSOR is not set
>>
>> #
>> # Camera ISPs
>> #
>> CONFIG_VIDEO_THP7312=y
>> # end of Camera ISPs
>>
>> #
>> # Lens drivers
>> #
>> CONFIG_VIDEO_AD5820=y
>> CONFIG_VIDEO_AK7375=y
>> CONFIG_VIDEO_DW9714=y
>> CONFIG_VIDEO_DW9719=y
>> # CONFIG_VIDEO_DW9768 is not set
>> CONFIG_VIDEO_DW9807_VCM=y
>> # end of Lens drivers
>>
>> #
>> # Flash devices
>> #
>> CONFIG_VIDEO_ADP1653=y
>> # CONFIG_VIDEO_LM3560 is not set
>> CONFIG_VIDEO_LM3646=y
>> # end of Flash devices
>>
>> #
>> # Audio decoders, processors and mixers
>> #
>> # CONFIG_VIDEO_CS3308 is not set
>> CONFIG_VIDEO_CS5345=y
>> CONFIG_VIDEO_CS53L32A=y
>> CONFIG_VIDEO_MSP3400=y
>> CONFIG_VIDEO_SONY_BTF_MPX=y
>> CONFIG_VIDEO_TDA7432=y
>> CONFIG_VIDEO_TDA9840=y
>> CONFIG_VIDEO_TEA6415C=y
>> CONFIG_VIDEO_TEA6420=y
>> CONFIG_VIDEO_TLV320AIC23B=y
>> # CONFIG_VIDEO_TVAUDIO is not set
>> # CONFIG_VIDEO_UDA1342 is not set
>> CONFIG_VIDEO_VP27SMPX=y
>> CONFIG_VIDEO_WM8739=y
>> CONFIG_VIDEO_WM8775=y
>> # end of Audio decoders, processors and mixers
>>
>> #
>> # RDS decoders
>> #
>> CONFIG_VIDEO_SAA6588=y
>> # end of RDS decoders
>>
>> #
>> # Video decoders
>> #
>> # CONFIG_VIDEO_ADV7180 is not set
>> # CONFIG_VIDEO_ADV7183 is not set
>> CONFIG_VIDEO_ADV748X=y
>> # CONFIG_VIDEO_ADV7604 is not set
>> CONFIG_VIDEO_ADV7842=y
>> # CONFIG_VIDEO_ADV7842_CEC is not set
>> CONFIG_VIDEO_BT819=y
>> CONFIG_VIDEO_BT856=y
>> # CONFIG_VIDEO_BT866 is not set
>> CONFIG_VIDEO_ISL7998X=y
>> # CONFIG_VIDEO_KS0127 is not set
>> CONFIG_VIDEO_MAX9286=y
>> # CONFIG_VIDEO_ML86V7667 is not set
>> # CONFIG_VIDEO_SAA7110 is not set
>> # CONFIG_VIDEO_SAA711X is not set
>> CONFIG_VIDEO_TC358743=y
>> CONFIG_VIDEO_TC358743_CEC=y
>> # CONFIG_VIDEO_TC358746 is not set
>> # CONFIG_VIDEO_TVP514X is not set
>> CONFIG_VIDEO_TVP5150=y
>> CONFIG_VIDEO_TVP7002=y
>> # CONFIG_VIDEO_TW2804 is not set
>> # CONFIG_VIDEO_TW9900 is not set
>> # CONFIG_VIDEO_TW9903 is not set
>> CONFIG_VIDEO_TW9906=y
>> CONFIG_VIDEO_TW9910=y
>> CONFIG_VIDEO_VPX3220=y
>>
>> #
>> # Video and audio decoders
>> #
>> CONFIG_VIDEO_SAA717X=y
>> CONFIG_VIDEO_CX25840=y
>> # end of Video decoders
>>
>> #
>> # Video encoders
>> #
>> CONFIG_VIDEO_ADV7170=y
>> CONFIG_VIDEO_ADV7175=y
>> # CONFIG_VIDEO_ADV7343 is not set
>> CONFIG_VIDEO_ADV7393=y
>> # CONFIG_VIDEO_ADV7511 is not set
>> CONFIG_VIDEO_AK881X=y
>> # CONFIG_VIDEO_SAA7127 is not set
>> CONFIG_VIDEO_SAA7185=y
>> CONFIG_VIDEO_THS8200=y
>> # end of Video encoders
>>
>> #
>> # Video improvement chips
>> #
>> # CONFIG_VIDEO_UPD64031A is not set
>> CONFIG_VIDEO_UPD64083=y
>> # end of Video improvement chips
>>
>> #
>> # Audio/Video compression chips
>> #
>> # CONFIG_VIDEO_SAA6752HS is not set
>> # end of Audio/Video compression chips
>>
>> #
>> # SDR tuner chips
>> #
>> # CONFIG_SDR_MAX2175 is not set
>> # end of SDR tuner chips
>>
>> #
>> # Miscellaneous helper chips
>> #
>> # CONFIG_VIDEO_I2C is not set
>> # CONFIG_VIDEO_M52790 is not set
>> CONFIG_VIDEO_ST_MIPID02=y
>> # CONFIG_VIDEO_THS7303 is not set
>> # end of Miscellaneous helper chips
>>
>> #
>> # Video serializers and deserializers
>> #
>> CONFIG_VIDEO_DS90UB913=y
>> CONFIG_VIDEO_DS90UB953=y
>> CONFIG_VIDEO_DS90UB960=y
>> # end of Video serializers and deserializers
>>
>> CONFIG_MEDIA_TUNER=y
>>
>> #
>> # Customize TV tuners
>> #
>> CONFIG_MEDIA_TUNER_E4000=y
>> CONFIG_MEDIA_TUNER_FC0011=y
>> CONFIG_MEDIA_TUNER_FC0012=y
>> CONFIG_MEDIA_TUNER_FC0013=y
>> # CONFIG_MEDIA_TUNER_FC2580 is not set
>> CONFIG_MEDIA_TUNER_IT913X=y
>> # CONFIG_MEDIA_TUNER_M88RS6000T is not set
>> # CONFIG_MEDIA_TUNER_MAX2165 is not set
>> CONFIG_MEDIA_TUNER_MC44S803=y
>> # CONFIG_MEDIA_TUNER_MT2060 is not set
>> # CONFIG_MEDIA_TUNER_MT2063 is not set
>> CONFIG_MEDIA_TUNER_MT20XX=y
>> CONFIG_MEDIA_TUNER_MT2131=y
>> CONFIG_MEDIA_TUNER_MT2266=y
>> # CONFIG_MEDIA_TUNER_MXL301RF is not set
>> # CONFIG_MEDIA_TUNER_MXL5005S is not set
>> CONFIG_MEDIA_TUNER_MXL5007T=y
>> CONFIG_MEDIA_TUNER_QM1D1B0004=y
>> CONFIG_MEDIA_TUNER_QM1D1C0042=y
>> CONFIG_MEDIA_TUNER_QT1010=y
>> CONFIG_MEDIA_TUNER_R820T=y
>> # CONFIG_MEDIA_TUNER_SI2157 is not set
>> CONFIG_MEDIA_TUNER_SIMPLE=y
>> # CONFIG_MEDIA_TUNER_TDA18212 is not set
>> CONFIG_MEDIA_TUNER_TDA18218=y
>> # CONFIG_MEDIA_TUNER_TDA18250 is not set
>> CONFIG_MEDIA_TUNER_TDA18271=y
>> CONFIG_MEDIA_TUNER_TDA827X=y
>> CONFIG_MEDIA_TUNER_TDA8290=y
>> CONFIG_MEDIA_TUNER_TDA9887=y
>> CONFIG_MEDIA_TUNER_TEA5761=y
>> CONFIG_MEDIA_TUNER_TEA5767=y
>> CONFIG_MEDIA_TUNER_TUA9001=y
>> CONFIG_MEDIA_TUNER_XC2028=y
>> # CONFIG_MEDIA_TUNER_XC4000 is not set
>> CONFIG_MEDIA_TUNER_XC5000=y
>> # end of Customize TV tuners
>>
>> #
>> # Customise DVB Frontends
>> #
>>
>> #
>> # Multistandard (satellite) frontends
>> #
>> # CONFIG_DVB_M88DS3103 is not set
>> # CONFIG_DVB_MXL5XX is not set
>> CONFIG_DVB_STB0899=y
>> # CONFIG_DVB_STB6100 is not set
>> # CONFIG_DVB_STV090x is not set
>> CONFIG_DVB_STV0910=y
>> CONFIG_DVB_STV6110x=y
>> # CONFIG_DVB_STV6111 is not set
>>
>> #
>> # Multistandard (cable + terrestrial) frontends
>> #
>> CONFIG_DVB_DRXK=y
>> # CONFIG_DVB_MN88472 is not set
>> # CONFIG_DVB_MN88473 is not set
>> CONFIG_DVB_SI2165=y
>> # CONFIG_DVB_TDA18271C2DD is not set
>>
>> #
>> # DVB-S (satellite) frontends
>> #
>> # CONFIG_DVB_CX24110 is not set
>> # CONFIG_DVB_CX24116 is not set
>> CONFIG_DVB_CX24117=y
>> CONFIG_DVB_CX24120=y
>> CONFIG_DVB_CX24123=y
>> # CONFIG_DVB_DS3000 is not set
>> # CONFIG_DVB_MB86A16 is not set
>> # CONFIG_DVB_MT312 is not set
>> CONFIG_DVB_S5H1420=y
>> CONFIG_DVB_SI21XX=y
>> CONFIG_DVB_STB6000=y
>> CONFIG_DVB_STV0288=y
>> CONFIG_DVB_STV0299=y
>> CONFIG_DVB_STV0900=y
>> CONFIG_DVB_STV6110=y
>> # CONFIG_DVB_TDA10071 is not set
>> CONFIG_DVB_TDA10086=y
>> CONFIG_DVB_TDA8083=y
>> # CONFIG_DVB_TDA8261 is not set
>> CONFIG_DVB_TDA826X=y
>> # CONFIG_DVB_TS2020 is not set
>> CONFIG_DVB_TUA6100=y
>> CONFIG_DVB_TUNER_CX24113=y
>> # CONFIG_DVB_TUNER_ITD1000 is not set
>> CONFIG_DVB_VES1X93=y
>> CONFIG_DVB_ZL10036=y
>> CONFIG_DVB_ZL10039=y
>>
>> #
>> # DVB-T (terrestrial) frontends
>> #
>> CONFIG_DVB_AF9013=y
>> CONFIG_DVB_CX22700=y
>> # CONFIG_DVB_CX22702 is not set
>> CONFIG_DVB_CXD2820R=y
>> CONFIG_DVB_CXD2841ER=y
>> CONFIG_DVB_DIB3000MB=y
>> CONFIG_DVB_DIB3000MC=y
>> CONFIG_DVB_DIB7000M=y
>> # CONFIG_DVB_DIB7000P is not set
>> CONFIG_DVB_DIB9000=y
>> # CONFIG_DVB_DRXD is not set
>> CONFIG_DVB_EC100=y
>> CONFIG_DVB_L64781=y
>> # CONFIG_DVB_MT352 is not set
>> # CONFIG_DVB_NXT6000 is not set
>> # CONFIG_DVB_RTL2830 is not set
>> CONFIG_DVB_RTL2832=y
>> CONFIG_DVB_RTL2832_SDR=y
>> CONFIG_DVB_S5H1432=y
>> # CONFIG_DVB_SI2168 is not set
>> CONFIG_DVB_SP887X=y
>> CONFIG_DVB_STV0367=y
>> CONFIG_DVB_TDA10048=y
>> CONFIG_DVB_TDA1004X=y
>> # CONFIG_DVB_ZD1301_DEMOD is not set
>> # CONFIG_DVB_ZL10353 is not set
>>
>> #
>> # DVB-C (cable) frontends
>> #
>> # CONFIG_DVB_STV0297 is not set
>> # CONFIG_DVB_TDA10021 is not set
>> # CONFIG_DVB_TDA10023 is not set
>> # CONFIG_DVB_VES1820 is not set
>>
>> #
>> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
>> #
>> CONFIG_DVB_AU8522=y
>> # CONFIG_DVB_AU8522_DTV is not set
>> CONFIG_DVB_AU8522_V4L=y
>> CONFIG_DVB_BCM3510=y
>> # CONFIG_DVB_LG2160 is not set
>> # CONFIG_DVB_LGDT3305 is not set
>> CONFIG_DVB_LGDT3306A=y
>> CONFIG_DVB_LGDT330X=y
>> # CONFIG_DVB_MXL692 is not set
>> # CONFIG_DVB_NXT200X is not set
>> CONFIG_DVB_OR51132=y
>> CONFIG_DVB_OR51211=y
>> CONFIG_DVB_S5H1409=y
>> CONFIG_DVB_S5H1411=y
>>
>> #
>> # ISDB-T (terrestrial) frontends
>> #
>> # CONFIG_DVB_DIB8000 is not set
>> CONFIG_DVB_MB86A20S=y
>> CONFIG_DVB_S921=y
>>
>> #
>> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
>> #
>> CONFIG_DVB_MN88443X=y
>> # CONFIG_DVB_TC90522 is not set
>>
>> #
>> # Digital terrestrial only tuners/PLL
>> #
>> # CONFIG_DVB_PLL is not set
>> CONFIG_DVB_TUNER_DIB0070=y
>> CONFIG_DVB_TUNER_DIB0090=y
>>
>> #
>> # SEC control devices for DVB-S
>> #
>> CONFIG_DVB_A8293=y
>> # CONFIG_DVB_AF9033 is not set
>> CONFIG_DVB_ASCOT2E=y
>> CONFIG_DVB_ATBM8830=y
>> # CONFIG_DVB_HELENE is not set
>> CONFIG_DVB_HORUS3A=y
>> # CONFIG_DVB_ISL6405 is not set
>> CONFIG_DVB_ISL6421=y
>> CONFIG_DVB_ISL6423=y
>> CONFIG_DVB_IX2505V=y
>> # CONFIG_DVB_LGS8GL5 is not set
>> # CONFIG_DVB_LGS8GXX is not set
>> CONFIG_DVB_LNBH25=y
>> CONFIG_DVB_LNBH29=y
>> CONFIG_DVB_LNBP21=y
>> # CONFIG_DVB_LNBP22 is not set
>> CONFIG_DVB_M88RS2000=y
>> CONFIG_DVB_TDA665x=y
>> # CONFIG_DVB_DRX39XYJ is not set
>>
>> #
>> # Common Interface (EN50221) controller drivers
>> #
>> CONFIG_DVB_CXD2099=y
>> CONFIG_DVB_SP2=y
>> # end of Customise DVB Frontends
>>
>> #
>> # Tools to develop new frontends
>> #
>> CONFIG_DVB_DUMMY_FE=y
>> # end of Media ancillary drivers
>>
>> #
>> # Graphics support
>> #
>> CONFIG_APERTURE_HELPERS=y
>> CONFIG_VIDEO=y
>> CONFIG_AUXDISPLAY=y
>> CONFIG_CHARLCD=y
>> CONFIG_HD44780_COMMON=y
>> CONFIG_HD44780=y
>> CONFIG_LCD2S=y
>> CONFIG_PARPORT_PANEL=y
>> CONFIG_PANEL_PARPORT=0
>> CONFIG_PANEL_PROFILE=5
>> # CONFIG_PANEL_CHANGE_MESSAGE is not set
>> # CONFIG_CHARLCD_BL_OFF is not set
>> # CONFIG_CHARLCD_BL_ON is not set
>> CONFIG_CHARLCD_BL_FLASH=y
>> CONFIG_KS0108=y
>> CONFIG_KS0108_PORT=0x378
>> CONFIG_KS0108_DELAY=2
>> # CONFIG_CFAG12864B is not set
>> CONFIG_LINEDISP=y
>> CONFIG_IMG_ASCII_LCD=y
>> # CONFIG_MAX6959 is not set
>> # CONFIG_SEG_LED_GPIO is not set
>> CONFIG_PANEL=y
>> # CONFIG_DRM is not set
>>
>> #
>> # Frame buffer Devices
>> #
>> CONFIG_FB=y
>> CONFIG_FB_HECUBA=y
>> # CONFIG_FB_ARC is not set
>> # CONFIG_FB_VGA16 is not set
>> # CONFIG_FB_UVESA is not set
>> # CONFIG_FB_VESA is not set
>> CONFIG_FB_N411=y
>> CONFIG_FB_HGA=y
>> # CONFIG_FB_OPENCORES is not set
>> # CONFIG_FB_S1D13XXX is not set
>> CONFIG_FB_SM501=y
>> # CONFIG_FB_SMSCUFX is not set
>> CONFIG_FB_IBM_GXT4500=y
>> CONFIG_FB_VIRTUAL=y
>> CONFIG_FB_METRONOME=y
>> CONFIG_FB_HYPERV=y
>> CONFIG_FB_SIMPLE=y
>> CONFIG_FB_SSD1307=y
>> CONFIG_FB_CORE=y
>> CONFIG_FB_NOTIFY=y
>> # CONFIG_FIRMWARE_EDID is not set
>> # CONFIG_FB_DEVICE is not set
>> CONFIG_FB_CFB_FILLRECT=y
>> CONFIG_FB_CFB_COPYAREA=y
>> CONFIG_FB_CFB_IMAGEBLIT=y
>> CONFIG_FB_SYS_FILLRECT=y
>> CONFIG_FB_SYS_COPYAREA=y
>> CONFIG_FB_SYS_IMAGEBLIT=y
>> # CONFIG_FB_FOREIGN_ENDIAN is not set
>> CONFIG_FB_SYSMEM_FOPS=y
>> CONFIG_FB_DEFERRED_IO=y
>> CONFIG_FB_IOMEM_FOPS=y
>> CONFIG_FB_IOMEM_HELPERS=y
>> CONFIG_FB_IOMEM_HELPERS_DEFERRED=y
>> CONFIG_FB_SYSMEM_HELPERS=y
>> CONFIG_FB_SYSMEM_HELPERS_DEFERRED=y
>> CONFIG_FB_BACKLIGHT=y
>> # CONFIG_FB_MODE_HELPERS is not set
>> CONFIG_FB_TILEBLITTING=y
>> # end of Frame buffer Devices
>>
>> #
>> # Backlight & LCD device support
>> #
>> CONFIG_LCD_CLASS_DEVICE=y
>> CONFIG_LCD_PLATFORM=y
>> CONFIG_BACKLIGHT_CLASS_DEVICE=y
>> CONFIG_BACKLIGHT_KTD253=y
>> # CONFIG_BACKLIGHT_KTD2801 is not set
>> CONFIG_BACKLIGHT_KTZ8866=y
>> CONFIG_BACKLIGHT_LM3533=y
>> CONFIG_BACKLIGHT_DA903X=y
>> CONFIG_BACKLIGHT_QCOM_WLED=y
>> CONFIG_BACKLIGHT_RT4831=y
>> CONFIG_BACKLIGHT_SAHARA=y
>> CONFIG_BACKLIGHT_ADP8860=y
>> CONFIG_BACKLIGHT_ADP8870=y
>> CONFIG_BACKLIGHT_PCF50633=y
>> CONFIG_BACKLIGHT_LM3639=y
>> CONFIG_BACKLIGHT_SKY81452=y
>> # CONFIG_BACKLIGHT_AS3711 is not set
>> CONFIG_BACKLIGHT_GPIO=y
>> # CONFIG_BACKLIGHT_LV5207LP is not set
>> CONFIG_BACKLIGHT_BD6107=y
>> CONFIG_BACKLIGHT_ARCXCNN=y
>> CONFIG_BACKLIGHT_LED=y
>> # end of Backlight & LCD device support
>>
>> CONFIG_HDMI=y
>> # CONFIG_LOGO is not set
>> # end of Graphics support
>>
>> CONFIG_SOUND=y
>> # CONFIG_SND is not set
>> CONFIG_USB_OHCI_LITTLE_ENDIAN=y
>> CONFIG_USB_SUPPORT=y
>> CONFIG_USB_COMMON=y
>> # CONFIG_USB_ULPI_BUS is not set
>> # CONFIG_USB_CONN_GPIO is not set
>> CONFIG_USB_ARCH_HAS_HCD=y
>> CONFIG_USB=y
>> CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
>>
>> #
>> # Miscellaneous USB options
>> #
>> CONFIG_USB_DEFAULT_PERSIST=y
>> CONFIG_USB_FEW_INIT_RETRIES=y
>> # CONFIG_USB_DYNAMIC_MINORS is not set
>> CONFIG_USB_OTG=y
>> # CONFIG_USB_OTG_PRODUCTLIST is not set
>> # CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
>> # CONFIG_USB_OTG_FSM is not set
>> CONFIG_USB_AUTOSUSPEND_DELAY=2
>> CONFIG_USB_DEFAULT_AUTHORIZATION_MODE=1
>> CONFIG_USB_MON=y
>>
>> #
>> # USB Host Controller Drivers
>> #
>> CONFIG_USB_C67X00_HCD=y
>> # CONFIG_USB_XHCI_HCD is not set
>> # CONFIG_USB_EHCI_HCD is not set
>> # CONFIG_USB_OXU210HP_HCD is not set
>> CONFIG_USB_ISP116X_HCD=y
>> CONFIG_USB_OHCI_HCD=y
>> # CONFIG_USB_OHCI_HCD_SSB is not set
>> CONFIG_USB_OHCI_HCD_PLATFORM=y
>> CONFIG_USB_SL811_HCD=y
>> CONFIG_USB_SL811_HCD_ISO=y
>> CONFIG_USB_R8A66597_HCD=y
>> CONFIG_USB_HCD_BCMA=y
>> CONFIG_USB_HCD_SSB=y
>> CONFIG_USB_HCD_TEST_MODE=y
>>
>> #
>> # USB Device Class drivers
>> #
>> CONFIG_USB_PRINTER=y
>> CONFIG_USB_WDM=y
>> CONFIG_USB_TMC=y
>>
>> #
>> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
>> #
>>
>> #
>> # also be needed; see USB_STORAGE Help for more info
>> #
>>
>> #
>> # USB Imaging devices
>> #
>> CONFIG_USB_MDC800=y
>> CONFIG_USBIP_CORE=y
>> CONFIG_USBIP_VHCI_HCD=y
>> CONFIG_USBIP_VHCI_HC_PORTS=8
>> CONFIG_USBIP_VHCI_NR_HCS=1
>> # CONFIG_USBIP_HOST is not set
>> # CONFIG_USBIP_DEBUG is not set
>>
>> #
>> # USB dual-mode controller drivers
>> #
>> CONFIG_USB_CDNS_SUPPORT=y
>> CONFIG_USB_CDNS3=y
>> # CONFIG_USB_CDNS3_HOST is not set
>> CONFIG_USB_MUSB_HDRC=y
>> CONFIG_USB_MUSB_HOST=y
>>
>> #
>> # Platform Glue Layer
>> #
>>
>> #
>> # MUSB DMA mode
>> #
>> # CONFIG_MUSB_PIO_ONLY is not set
>> CONFIG_USB_DWC3=y
>> CONFIG_USB_DWC3_HOST=y
>>
>> #
>> # Platform Glue Driver Support
>> #
>> # CONFIG_USB_DWC3_OF_SIMPLE is not set
>> CONFIG_USB_DWC2=y
>> CONFIG_USB_DWC2_HOST=y
>>
>> #
>> # Gadget/Dual-role mode requires USB Gadget support to be enabled
>> #
>> CONFIG_USB_DWC2_DEBUG=y
>> # CONFIG_USB_DWC2_VERBOSE is not set
>> # CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
>> # CONFIG_USB_DWC2_DEBUG_PERIODIC is not set
>> CONFIG_USB_ISP1760=y
>> CONFIG_USB_ISP1760_HCD=y
>> CONFIG_USB_ISP1760_HOST_ROLE=y
>>
>> #
>> # USB port drivers
>> #
>>
>> #
>> # USB Miscellaneous drivers
>> #
>> CONFIG_USB_USS720=y
>> CONFIG_USB_EMI62=y
>> # CONFIG_USB_EMI26 is not set
>> CONFIG_USB_ADUTUX=y
>> CONFIG_USB_SEVSEG=y
>> # CONFIG_USB_LEGOTOWER is not set
>> CONFIG_USB_LCD=y
>> # CONFIG_USB_CYPRESS_CY7C63 is not set
>> # CONFIG_USB_CYTHERM is not set
>> # CONFIG_USB_IDMOUSE is not set
>> # CONFIG_USB_APPLEDISPLAY is not set
>> # CONFIG_APPLE_MFI_FASTCHARGE is not set
>> CONFIG_USB_SISUSBVGA=y
>> CONFIG_USB_LD=y
>> CONFIG_USB_TRANCEVIBRATOR=y
>> CONFIG_USB_IOWARRIOR=y
>> CONFIG_USB_TEST=y
>> CONFIG_USB_EHSET_TEST_FIXTURE=y
>> # CONFIG_USB_ISIGHTFW is not set
>> CONFIG_USB_YUREX=y
>> CONFIG_USB_EZUSB_FX2=y
>> CONFIG_USB_HUB_USB251XB=y
>> CONFIG_USB_HSIC_USB3503=y
>> CONFIG_USB_HSIC_USB4604=y
>> CONFIG_USB_LINK_LAYER_TEST=y
>> # CONFIG_USB_CHAOSKEY is not set
>> # CONFIG_USB_ONBOARD_DEV is not set
>> # CONFIG_USB_ATM is not set
>>
>> #
>> # USB Physical Layer drivers
>> #
>> CONFIG_USB_PHY=y
>> CONFIG_NOP_USB_XCEIV=y
>> CONFIG_USB_GPIO_VBUS=y
>> CONFIG_TAHVO_USB=y
>> # CONFIG_TAHVO_USB_HOST_BY_DEFAULT is not set
>> CONFIG_USB_ISP1301=y
>> # end of USB Physical Layer drivers
>>
>> # CONFIG_USB_GADGET is not set
>> # CONFIG_TYPEC is not set
>> CONFIG_USB_ROLE_SWITCH=y
>> CONFIG_MMC=y
>> CONFIG_PWRSEQ_EMMC=y
>> # CONFIG_PWRSEQ_SIMPLE is not set
>> CONFIG_MMC_TEST=y
>>
>> #
>> # MMC/SD/SDIO Host Controller Drivers
>> #
>> # CONFIG_MMC_DEBUG is not set
>> # CONFIG_MMC_SDHCI is not set
>> CONFIG_MMC_WBSD=y
>> # CONFIG_MMC_VUB300 is not set
>> CONFIG_MMC_USHC=y
>> CONFIG_MMC_USDHI6ROL0=y
>> # CONFIG_MMC_REALTEK_USB is not set
>> CONFIG_MMC_CQHCI=y
>> CONFIG_MMC_HSQ=y
>> CONFIG_MMC_MTK=y
>> CONFIG_MMC_LITEX=y
>> CONFIG_MEMSTICK=y
>> CONFIG_MEMSTICK_DEBUG=y
>>
>> #
>> # MemoryStick drivers
>> #
>> CONFIG_MEMSTICK_UNSAFE_RESUME=y
>>
>> #
>> # MemoryStick Host Controller Drivers
>> #
>> CONFIG_MEMSTICK_REALTEK_USB=y
>> CONFIG_NEW_LEDS=y
>> CONFIG_LEDS_CLASS=y
>> # CONFIG_LEDS_CLASS_FLASH is not set
>> # CONFIG_LEDS_CLASS_MULTICOLOR is not set
>> # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
>>
>> #
>> # LED drivers
>> #
>> CONFIG_LEDS_AN30259A=y
>> CONFIG_LEDS_AW200XX=y
>> CONFIG_LEDS_AW2013=y
>> CONFIG_LEDS_BCM6328=y
>> CONFIG_LEDS_BCM6358=y
>> CONFIG_LEDS_LM3530=y
>> # CONFIG_LEDS_LM3532 is not set
>> CONFIG_LEDS_LM3533=y
>> CONFIG_LEDS_LM3642=y
>> # CONFIG_LEDS_LM3692X is not set
>> CONFIG_LEDS_MT6323=y
>> CONFIG_LEDS_GPIO=y
>> CONFIG_LEDS_LP3944=y
>> CONFIG_LEDS_LP3952=y
>> CONFIG_LEDS_LP8860=y
>> CONFIG_LEDS_PCA955X=y
>> # CONFIG_LEDS_PCA955X_GPIO is not set
>> CONFIG_LEDS_PCA963X=y
>> CONFIG_LEDS_PCA995X=y
>> # CONFIG_LEDS_WM8350 is not set
>> CONFIG_LEDS_DA903X=y
>> # CONFIG_LEDS_REGULATOR is not set
>> # CONFIG_LEDS_BD2606MVV is not set
>> # CONFIG_LEDS_BD2802 is not set
>> CONFIG_LEDS_LT3593=y
>> CONFIG_LEDS_MAX5970=y
>> # CONFIG_LEDS_MC13783 is not set
>> CONFIG_LEDS_TCA6507=y
>> CONFIG_LEDS_TLC591XX=y
>> CONFIG_LEDS_MAX77650=y
>> CONFIG_LEDS_LM355x=y
>> CONFIG_LEDS_MENF21BMC=y
>> CONFIG_LEDS_IS31FL319X=y
>> CONFIG_LEDS_IS31FL32XX=y
>>
>> #
>> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
>> #
>> CONFIG_LEDS_BLINKM=y
>> CONFIG_LEDS_SYSCON=y
>> CONFIG_LEDS_MLXREG=y
>> CONFIG_LEDS_USER=y
>> CONFIG_LEDS_TI_LMU_COMMON=y
>> # CONFIG_LEDS_LM3697 is not set
>> CONFIG_LEDS_LM36274=y
>> # CONFIG_LEDS_TPS6105X is not set
>> # CONFIG_LEDS_LGM is not set
>>
>> #
>> # Flash and Torch LED drivers
>> #
>>
>> #
>> # RGB LED drivers
>> #
>>
>> #
>> # LED Triggers
>> #
>> # CONFIG_LEDS_TRIGGERS is not set
>>
>> #
>> # Simple LED drivers
>> #
>> CONFIG_LEDS_SIEMENS_SIMATIC_IPC=y
>> CONFIG_LEDS_SIEMENS_SIMATIC_IPC_F7188X=y
>> # CONFIG_ACCESSIBILITY is not set
>> CONFIG_EDAC_ATOMIC_SCRUB=y
>> CONFIG_EDAC_SUPPORT=y
>> CONFIG_RTC_LIB=y
>> CONFIG_RTC_MC146818_LIB=y
>> CONFIG_RTC_CLASS=y
>> # CONFIG_RTC_HCTOSYS is not set
>> # CONFIG_RTC_SYSTOHC is not set
>> # CONFIG_RTC_DEBUG is not set
>> # CONFIG_RTC_LIB_KUNIT_TEST is not set
>> CONFIG_RTC_NVMEM=y
>>
>> #
>> # RTC interfaces
>> #
>> # CONFIG_RTC_INTF_SYSFS is not set
>> # CONFIG_RTC_INTF_DEV is not set
>> # CONFIG_RTC_DRV_TEST is not set
>>
>> #
>> # I2C RTC drivers
>> #
>> # CONFIG_RTC_DRV_ABB5ZES3 is not set
>> CONFIG_RTC_DRV_ABEOZ9=y
>> # CONFIG_RTC_DRV_ABX80X is not set
>> # CONFIG_RTC_DRV_AS3722 is not set
>> CONFIG_RTC_DRV_DS1307=y
>> CONFIG_RTC_DRV_DS1307_CENTURY=y
>> CONFIG_RTC_DRV_DS1374=y
>> CONFIG_RTC_DRV_DS1672=y
>> CONFIG_RTC_DRV_HYM8563=y
>> # CONFIG_RTC_DRV_MAX6900 is not set
>> CONFIG_RTC_DRV_MAX31335=y
>> # CONFIG_RTC_DRV_MAX77686 is not set
>> # CONFIG_RTC_DRV_NCT3018Y is not set
>> # CONFIG_RTC_DRV_RS5C372 is not set
>> CONFIG_RTC_DRV_ISL1208=y
>> CONFIG_RTC_DRV_ISL12022=y
>> # CONFIG_RTC_DRV_ISL12026 is not set
>> CONFIG_RTC_DRV_X1205=y
>> # CONFIG_RTC_DRV_PCF8523 is not set
>> # CONFIG_RTC_DRV_PCF85063 is not set
>> CONFIG_RTC_DRV_PCF85363=y
>> CONFIG_RTC_DRV_PCF8563=y
>> CONFIG_RTC_DRV_PCF8583=y
>> CONFIG_RTC_DRV_M41T80=y
>> CONFIG_RTC_DRV_M41T80_WDT=y
>> CONFIG_RTC_DRV_BD70528=y
>> CONFIG_RTC_DRV_BQ32K=y
>> CONFIG_RTC_DRV_PALMAS=y
>> CONFIG_RTC_DRV_TPS6594=y
>> CONFIG_RTC_DRV_TPS65910=y
>> CONFIG_RTC_DRV_RC5T619=y
>> # CONFIG_RTC_DRV_S35390A is not set
>> CONFIG_RTC_DRV_FM3130=y
>> CONFIG_RTC_DRV_RX8010=y
>> CONFIG_RTC_DRV_RX8111=y
>> CONFIG_RTC_DRV_RX8581=y
>> CONFIG_RTC_DRV_RX8025=y
>> CONFIG_RTC_DRV_EM3027=y
>> CONFIG_RTC_DRV_RV3028=y
>> CONFIG_RTC_DRV_RV3032=y
>> CONFIG_RTC_DRV_RV8803=y
>> CONFIG_RTC_DRV_S5M=y
>> CONFIG_RTC_DRV_SD3078=y
>>
>> #
>> # SPI RTC drivers
>> #
>> CONFIG_RTC_I2C_AND_SPI=y
>>
>> #
>> # SPI and I2C RTC drivers
>> #
>> CONFIG_RTC_DRV_DS3232=y
>> # CONFIG_RTC_DRV_DS3232_HWMON is not set
>> CONFIG_RTC_DRV_PCF2127=y
>> CONFIG_RTC_DRV_RV3029C2=y
>> # CONFIG_RTC_DRV_RV3029_HWMON is not set
>> CONFIG_RTC_DRV_RX6110=y
>>
>> #
>> # Platform RTC drivers
>> #
>> CONFIG_RTC_DRV_CMOS=y
>> CONFIG_RTC_DRV_DS1286=y
>> CONFIG_RTC_DRV_DS1511=y
>> CONFIG_RTC_DRV_DS1553=y
>> CONFIG_RTC_DRV_DS1685_FAMILY=y
>> # CONFIG_RTC_DRV_DS1685 is not set
>> CONFIG_RTC_DRV_DS1689=y
>> # CONFIG_RTC_DRV_DS17285 is not set
>> # CONFIG_RTC_DRV_DS17485 is not set
>> # CONFIG_RTC_DRV_DS17885 is not set
>> CONFIG_RTC_DRV_DS1742=y
>> CONFIG_RTC_DRV_DS2404=y
>> CONFIG_RTC_DRV_DA9055=y
>> CONFIG_RTC_DRV_DA9063=y
>> CONFIG_RTC_DRV_STK17TA8=y
>> CONFIG_RTC_DRV_M48T86=y
>> CONFIG_RTC_DRV_M48T35=y
>> # CONFIG_RTC_DRV_M48T59 is not set
>> # CONFIG_RTC_DRV_MSM6242 is not set
>> CONFIG_RTC_DRV_RP5C01=y
>> # CONFIG_RTC_DRV_WM8350 is not set
>> CONFIG_RTC_DRV_PCF50633=y
>> # CONFIG_RTC_DRV_ZYNQMP is not set
>>
>> #
>> # on-CPU RTC drivers
>> #
>> # CONFIG_RTC_DRV_CADENCE is not set
>> CONFIG_RTC_DRV_FTRTC010=y
>> CONFIG_RTC_DRV_MC13XXX=y
>> CONFIG_RTC_DRV_MT6397=y
>> CONFIG_RTC_DRV_R7301=y
>>
>> #
>> # HID Sensor RTC drivers
>> #
>> CONFIG_RTC_DRV_GOLDFISH=y
>> CONFIG_DMADEVICES=y
>> CONFIG_DMADEVICES_DEBUG=y
>> # CONFIG_DMADEVICES_VDEBUG is not set
>>
>> #
>> # DMA Devices
>> #
>> CONFIG_DMA_ENGINE=y
>> CONFIG_DMA_VIRTUAL_CHANNELS=y
>> CONFIG_DMA_OF=y
>> CONFIG_ALTERA_MSGDMA=y
>> CONFIG_DW_AXI_DMAC=y
>> CONFIG_FSL_EDMA=y
>> # CONFIG_INTEL_IDMA64 is not set
>> CONFIG_XILINX_DMA=y
>> # CONFIG_XILINX_XDMA is not set
>> CONFIG_XILINX_ZYNQMP_DPDMA=y
>> CONFIG_QCOM_HIDMA_MGMT=y
>> CONFIG_QCOM_HIDMA=y
>> # CONFIG_DW_DMAC is not set
>> CONFIG_SF_PDMA=y
>> # CONFIG_INTEL_LDMA is not set
>>
>> #
>> # DMA Clients
>> #
>> # CONFIG_ASYNC_TX_DMA is not set
>> CONFIG_DMATEST=y
>> CONFIG_DMA_ENGINE_RAID=y
>>
>> #
>> # DMABUF options
>> #
>> CONFIG_SYNC_FILE=y
>> # CONFIG_SW_SYNC is not set
>> CONFIG_DMABUF_MOVE_NOTIFY=y
>> CONFIG_DMABUF_DEBUG=y
>> # CONFIG_DMABUF_SELFTESTS is not set
>> CONFIG_DMABUF_HEAPS=y
>> CONFIG_DMABUF_SYSFS_STATS=y
>> CONFIG_DMABUF_HEAPS_SYSTEM=y
>> # CONFIG_DMABUF_HEAPS_CMA is not set
>> # end of DMABUF options
>>
>> CONFIG_UIO=y
>> # CONFIG_UIO_PDRV_GENIRQ is not set
>> CONFIG_UIO_DMEM_GENIRQ=y
>> CONFIG_UIO_HV_GENERIC=y
>> CONFIG_UIO_DFL=y
>> CONFIG_VFIO=y
>> CONFIG_VFIO_GROUP=y
>> CONFIG_VFIO_CONTAINER=y
>> CONFIG_VFIO_IOMMU_TYPE1=y
>> # CONFIG_VFIO_NOIOMMU is not set
>> CONFIG_VFIO_DEBUGFS=y
>> # CONFIG_VIRT_DRIVERS is not set
>> CONFIG_VIRTIO_ANCHOR=y
>> CONFIG_VIRTIO=y
>> # CONFIG_VIRTIO_MENU is not set
>> # CONFIG_VDPA is not set
>> CONFIG_VHOST_MENU=y
>> CONFIG_VHOST_CROSS_ENDIAN_LEGACY=y
>>
>> #
>> # Microsoft Hyper-V guest support
>> #
>> CONFIG_HYPERV=y
>> CONFIG_HYPERV_VTL_MODE=y
>> CONFIG_HYPERV_TIMER=y
>> # CONFIG_HYPERV_UTILS is not set
>> CONFIG_HYPERV_BALLOON=y
>> # end of Microsoft Hyper-V guest support
>>
>> CONFIG_GREYBUS=y
>> CONFIG_GREYBUS_ES2=y
>> CONFIG_COMEDI=y
>> # CONFIG_COMEDI_DEBUG is not set
>> CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
>> CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
>> # CONFIG_COMEDI_MISC_DRIVERS is not set
>> CONFIG_COMEDI_ISA_DRIVERS=y
>> CONFIG_COMEDI_PCL711=y
>> CONFIG_COMEDI_PCL724=y
>> CONFIG_COMEDI_PCL726=y
>> CONFIG_COMEDI_PCL730=y
>> CONFIG_COMEDI_PCL812=y
>> CONFIG_COMEDI_PCL816=y
>> CONFIG_COMEDI_PCL818=y
>> # CONFIG_COMEDI_PCM3724 is not set
>> # CONFIG_COMEDI_AMPLC_DIO200_ISA is not set
>> CONFIG_COMEDI_AMPLC_PC236_ISA=y
>> # CONFIG_COMEDI_AMPLC_PC263_ISA is not set
>> CONFIG_COMEDI_RTI800=y
>> # CONFIG_COMEDI_RTI802 is not set
>> # CONFIG_COMEDI_DAC02 is not set
>> CONFIG_COMEDI_DAS16M1=y
>> CONFIG_COMEDI_DAS08_ISA=y
>> # CONFIG_COMEDI_DAS16 is not set
>> CONFIG_COMEDI_DAS800=y
>> # CONFIG_COMEDI_DAS1800 is not set
>> CONFIG_COMEDI_DAS6402=y
>> CONFIG_COMEDI_DT2801=y
>> CONFIG_COMEDI_DT2811=y
>> CONFIG_COMEDI_DT2814=y
>> CONFIG_COMEDI_DT2815=y
>> # CONFIG_COMEDI_DT2817 is not set
>> CONFIG_COMEDI_DT282X=y
>> CONFIG_COMEDI_DMM32AT=y
>> CONFIG_COMEDI_FL512=y
>> CONFIG_COMEDI_AIO_AIO12_8=y
>> CONFIG_COMEDI_AIO_IIRO_16=y
>> CONFIG_COMEDI_II_PCI20KC=y
>> CONFIG_COMEDI_C6XDIGIO=y
>> CONFIG_COMEDI_MPC624=y
>> CONFIG_COMEDI_ADQ12B=y
>> CONFIG_COMEDI_NI_AT_A2150=y
>> # CONFIG_COMEDI_NI_AT_AO is not set
>> # CONFIG_COMEDI_NI_ATMIO is not set
>> CONFIG_COMEDI_NI_ATMIO16D=y
>> CONFIG_COMEDI_NI_LABPC_ISA=y
>> # CONFIG_COMEDI_PCMAD is not set
>> CONFIG_COMEDI_PCMDA12=y
>> CONFIG_COMEDI_PCMMIO=y
>> # CONFIG_COMEDI_PCMUIO is not set
>> # CONFIG_COMEDI_MULTIQ3 is not set
>> CONFIG_COMEDI_S526=y
>> CONFIG_COMEDI_USB_DRIVERS=y
>> CONFIG_COMEDI_DT9812=y
>> CONFIG_COMEDI_NI_USB6501=y
>> # CONFIG_COMEDI_USBDUX is not set
>> CONFIG_COMEDI_USBDUXFAST=y
>> CONFIG_COMEDI_USBDUXSIGMA=y
>> CONFIG_COMEDI_VMK80XX=y
>> CONFIG_COMEDI_8254=y
>> CONFIG_COMEDI_8255=y
>> # CONFIG_COMEDI_8255_SA is not set
>> # CONFIG_COMEDI_KCOMEDILIB is not set
>> CONFIG_COMEDI_AMPLC_PC236=y
>> CONFIG_COMEDI_DAS08=y
>> CONFIG_COMEDI_ISADMA=y
>> CONFIG_COMEDI_NI_LABPC=y
>> CONFIG_COMEDI_NI_LABPC_ISADMA=y
>> # CONFIG_COMEDI_TESTS is not set
>> # CONFIG_STAGING is not set
>> # CONFIG_GOLDFISH is not set
>> CONFIG_CHROME_PLATFORMS=y
>> CONFIG_CHROMEOS_PSTORE=y
>> # CONFIG_CROS_EC is not set
>> CONFIG_MELLANOX_PLATFORM=y
>> CONFIG_MLXREG_HOTPLUG=y
>> CONFIG_MLXREG_IO=y
>> CONFIG_MLXREG_LC=y
>> # CONFIG_SURFACE_PLATFORMS is not set
>> CONFIG_X86_PLATFORM_DEVICES=y
>> # CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
>> CONFIG_AMILO_RFKILL=y
>> # CONFIG_X86_PLATFORM_DRIVERS_HP is not set
>> CONFIG_INTEL_ATOMISP2_PDX86=y
>> CONFIG_INTEL_ATOMISP2_LED=y
>> CONFIG_INTEL_IFS=y
>>
>> #
>> # Intel Uncore Frequency Control
>> #
>> CONFIG_INTEL_UNCORE_FREQ_CONTROL=y
>> # end of Intel Uncore Frequency Control
>>
>> CONFIG_INTEL_PUNIT_IPC=y
>> CONFIG_BARCO_P50_GPIO=y
>> CONFIG_SAMSUNG_LAPTOP=y
>> CONFIG_SIEMENS_SIMATIC_IPC=y
>> CONFIG_SIEMENS_SIMATIC_IPC_BATT=y
>> CONFIG_HAVE_CLK=y
>> CONFIG_HAVE_CLK_PREPARE=y
>> CONFIG_COMMON_CLK=y
>> CONFIG_COMMON_CLK_MAX77686=y
>> # CONFIG_COMMON_CLK_MAX9485 is not set
>> # CONFIG_COMMON_CLK_SI5341 is not set
>> # CONFIG_COMMON_CLK_SI5351 is not set
>> # CONFIG_COMMON_CLK_SI514 is not set
>> CONFIG_COMMON_CLK_SI544=y
>> CONFIG_COMMON_CLK_SI570=y
>> # CONFIG_COMMON_CLK_CDCE706 is not set
>> CONFIG_COMMON_CLK_CDCE925=y
>> CONFIG_COMMON_CLK_CS2000_CP=y
>> # CONFIG_COMMON_CLK_S2MPS11 is not set
>> CONFIG_COMMON_CLK_AXI_CLKGEN=y
>> CONFIG_COMMON_CLK_PALMAS=y
>> # CONFIG_COMMON_CLK_RS9_PCIE is not set
>> # CONFIG_COMMON_CLK_SI521XX is not set
>> CONFIG_COMMON_CLK_VC3=y
>> CONFIG_COMMON_CLK_VC5=y
>> # CONFIG_COMMON_CLK_VC7 is not set
>> CONFIG_COMMON_CLK_BD718XX=y
>> CONFIG_COMMON_CLK_FIXED_MMIO=y
>> # CONFIG_CLK_LGM_CGU is not set
>> CONFIG_XILINX_VCU=y
>> # CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
>> CONFIG_CLK_KUNIT_TEST=y
>> # CONFIG_CLK_GATE_KUNIT_TEST is not set
>> CONFIG_CLK_FD_KUNIT_TEST=y
>> # CONFIG_HWSPINLOCK is not set
>>
>> #
>> # Clock Source drivers
>> #
>> CONFIG_CLKEVT_I8253=y
>> CONFIG_CLKBLD_I8253=y
>> # end of Clock Source drivers
>>
>> CONFIG_MAILBOX=y
>> # CONFIG_ARM_MHU_V3 is not set
>> CONFIG_PLATFORM_MHU=y
>> CONFIG_ALTERA_MBOX=y
>> # CONFIG_MAILBOX_TEST is not set
>> CONFIG_IOMMU_API=y
>> # CONFIG_IOMMU_SUPPORT is not set
>>
>> #
>> # Remoteproc drivers
>> #
>> # CONFIG_REMOTEPROC is not set
>> # end of Remoteproc drivers
>>
>> #
>> # Rpmsg drivers
>> #
>> CONFIG_RPMSG=y
>> CONFIG_RPMSG_CHAR=y
>> CONFIG_RPMSG_CTRL=y
>> CONFIG_RPMSG_NS=y
>> CONFIG_RPMSG_QCOM_GLINK=y
>> CONFIG_RPMSG_QCOM_GLINK_RPM=y
>> # CONFIG_RPMSG_VIRTIO is not set
>> # end of Rpmsg drivers
>>
>> CONFIG_SOUNDWIRE=y
>>
>> #
>> # SoundWire Devices
>> #
>>
>> #
>> # SOC (System On Chip) specific Drivers
>> #
>>
>> #
>> # Amlogic SoC drivers
>> #
>> # end of Amlogic SoC drivers
>>
>> #
>> # Broadcom SoC drivers
>> #
>> # end of Broadcom SoC drivers
>>
>> #
>> # NXP/Freescale QorIQ SoC drivers
>> #
>> # end of NXP/Freescale QorIQ SoC drivers
>>
>> #
>> # fujitsu SoC drivers
>> #
>> # end of fujitsu SoC drivers
>>
>> #
>> # i.MX SoC drivers
>> #
>> # end of i.MX SoC drivers
>>
>> #
>> # Enable LiteX SoC Builder specific drivers
>> #
>> CONFIG_LITEX=y
>> CONFIG_LITEX_SOC_CONTROLLER=y
>> # end of Enable LiteX SoC Builder specific drivers
>>
>> # CONFIG_WPCM450_SOC is not set
>>
>> #
>> # Qualcomm SoC drivers
>> #
>> # CONFIG_QCOM_PMIC_PDCHARGER_ULOG is not set
>> # end of Qualcomm SoC drivers
>>
>> # CONFIG_SOC_TI is not set
>>
>> #
>> # Xilinx SoC drivers
>> #
>> # end of Xilinx SoC drivers
>> # end of SOC (System On Chip) specific Drivers
>>
>> #
>> # PM Domains
>> #
>>
>> #
>> # Amlogic PM Domains
>> #
>> # end of Amlogic PM Domains
>>
>> #
>> # Broadcom PM Domains
>> #
>> # end of Broadcom PM Domains
>>
>> #
>> # i.MX PM Domains
>> #
>> # end of i.MX PM Domains
>>
>> #
>> # Qualcomm PM Domains
>> #
>> # end of Qualcomm PM Domains
>> # end of PM Domains
>>
>> # CONFIG_PM_DEVFREQ is not set
>> CONFIG_EXTCON=y
>>
>> #
>> # Extcon Device Drivers
>> #
>> CONFIG_EXTCON_GPIO=y
>> # CONFIG_EXTCON_MAX3355 is not set
>> CONFIG_EXTCON_MAX77843=y
>> # CONFIG_EXTCON_PALMAS is not set
>> # CONFIG_EXTCON_PTN5150 is not set
>> # CONFIG_EXTCON_RT8973A is not set
>> CONFIG_EXTCON_SM5502=y
>> CONFIG_EXTCON_USB_GPIO=y
>> # CONFIG_MEMORY is not set
>> # CONFIG_IIO is not set
>> # CONFIG_PWM is not set
>>
>> #
>> # IRQ chip support
>> #
>> CONFIG_IRQCHIP=y
>> # CONFIG_AL_FIC is not set
>> CONFIG_MADERA_IRQ=y
>> # CONFIG_XILINX_INTC is not set
>> # end of IRQ chip support
>>
>> CONFIG_IPACK_BUS=y
>> # CONFIG_RESET_CONTROLLER is not set
>>
>> #
>> # PHY Subsystem
>> #
>> CONFIG_GENERIC_PHY=y
>> CONFIG_GENERIC_PHY_MIPI_DPHY=y
>> CONFIG_USB_LGM_PHY=y
>> # CONFIG_PHY_CAN_TRANSCEIVER is not set
>>
>> #
>> # PHY drivers for Broadcom platforms
>> #
>> # CONFIG_BCM_KONA_USB2_PHY is not set
>> # end of PHY drivers for Broadcom platforms
>>
>> CONFIG_PHY_CADENCE_TORRENT=y
>> CONFIG_PHY_CADENCE_DPHY=y
>> CONFIG_PHY_CADENCE_DPHY_RX=y
>> CONFIG_PHY_CADENCE_SALVO=y
>> CONFIG_PHY_PXA_28NM_HSIC=y
>> CONFIG_PHY_PXA_28NM_USB2=y
>> CONFIG_PHY_LAN966X_SERDES=y
>> CONFIG_PHY_MAPPHONE_MDM6600=y
>> CONFIG_PHY_OCELOT_SERDES=y
>> # CONFIG_PHY_SAMSUNG_USB2 is not set
>> CONFIG_PHY_INTEL_LGM_COMBO=y
>> CONFIG_PHY_INTEL_LGM_EMMC=y
>> # end of PHY Subsystem
>>
>> CONFIG_POWERCAP=y
>> # CONFIG_DTPM is not set
>> CONFIG_MCB=y
>> # CONFIG_MCB_LPC is not set
>>
>> #
>> # Performance monitor support
>> #
>> # end of Performance monitor support
>>
>> # CONFIG_RAS is not set
>>
>> #
>> # Android
>> #
>> CONFIG_ANDROID_BINDER_IPC=y
>> # CONFIG_ANDROID_BINDERFS is not set
>> CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
>> # CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
>> # end of Android
>>
>> # CONFIG_DAX is not set
>> CONFIG_NVMEM=y
>> CONFIG_NVMEM_SYSFS=y
>> CONFIG_NVMEM_LAYOUTS=y
>>
>> #
>> # Layout Types
>> #
>> # CONFIG_NVMEM_LAYOUT_SL28_VPD is not set
>> CONFIG_NVMEM_LAYOUT_ONIE_TLV=y
>> # end of Layout Types
>>
>> CONFIG_NVMEM_RMEM=y
>> CONFIG_NVMEM_U_BOOT_ENV=y
>>
>> #
>> # HW tracing support
>> #
>> CONFIG_STM=y
>> CONFIG_STM_PROTO_BASIC=y
>> CONFIG_STM_PROTO_SYS_T=y
>> # CONFIG_STM_DUMMY is not set
>> CONFIG_STM_SOURCE_CONSOLE=y
>> # CONFIG_STM_SOURCE_HEARTBEAT is not set
>> CONFIG_STM_SOURCE_FTRACE=y
>> # CONFIG_INTEL_TH is not set
>> # end of HW tracing support
>>
>> CONFIG_FPGA=y
>> # CONFIG_ALTERA_PR_IP_CORE is not set
>> CONFIG_FPGA_MGR_XILINX_CORE=y
>> CONFIG_FPGA_MGR_XILINX_SELECTMAP=y
>> CONFIG_FPGA_BRIDGE=y
>> CONFIG_ALTERA_FREEZE_BRIDGE=y
>> CONFIG_XILINX_PR_DECOUPLER=y
>> CONFIG_FPGA_REGION=y
>> CONFIG_OF_FPGA_REGION=y
>> CONFIG_FPGA_DFL=y
>> CONFIG_FPGA_DFL_FME=y
>> CONFIG_FPGA_DFL_FME_MGR=y
>> # CONFIG_FPGA_DFL_FME_BRIDGE is not set
>> # CONFIG_FPGA_DFL_FME_REGION is not set
>> CONFIG_FPGA_DFL_AFU=y
>> CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000=y
>> CONFIG_FPGA_M10_BMC_SEC_UPDATE=y
>> # CONFIG_FPGA_KUNIT_TESTS is not set
>> # CONFIG_FSI is not set
>> # CONFIG_TEE is not set
>> CONFIG_MULTIPLEXER=y
>>
>> #
>> # Multiplexer drivers
>> #
>> CONFIG_MUX_ADG792A=y
>> CONFIG_MUX_GPIO=y
>> CONFIG_MUX_MMIO=y
>> # end of Multiplexer drivers
>>
>> # CONFIG_SIOX is not set
>> CONFIG_SLIMBUS=y
>> CONFIG_SLIM_QCOM_CTRL=y
>> # CONFIG_INTERCONNECT is not set
>> CONFIG_I8254=y
>> CONFIG_COUNTER=y
>> # CONFIG_104_QUAD_8 is not set
>> # CONFIG_INTERRUPT_CNT is not set
>> # CONFIG_MOST is not set
>> # CONFIG_PECI is not set
>> # CONFIG_HTE is not set
>> # end of Device Drivers
>>
>> #
>> # File systems
>> #
>> CONFIG_DCACHE_WORD_ACCESS=y
>> CONFIG_VALIDATE_FS_PARSER=y
>> CONFIG_FS_STACK=y
>> CONFIG_FS_POSIX_ACL=y
>> CONFIG_EXPORTFS=y
>> # CONFIG_EXPORTFS_BLOCK_OPS is not set
>> # CONFIG_FILE_LOCKING is not set
>> CONFIG_FS_ENCRYPTION=y
>> CONFIG_FS_VERITY=y
>> # CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
>> CONFIG_FSNOTIFY=y
>> CONFIG_DNOTIFY=y
>> CONFIG_INOTIFY_USER=y
>> # CONFIG_FANOTIFY is not set
>> # CONFIG_QUOTA is not set
>> # CONFIG_AUTOFS_FS is not set
>> CONFIG_FUSE_FS=y
>> # CONFIG_CUSE is not set
>> # CONFIG_VIRTIO_FS is not set
>> CONFIG_FUSE_PASSTHROUGH=y
>> CONFIG_OVERLAY_FS=y
>> # CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
>> # CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
>> CONFIG_OVERLAY_FS_INDEX=y
>> CONFIG_OVERLAY_FS_NFS_EXPORT=y
>> # CONFIG_OVERLAY_FS_XINO_AUTO is not set
>> # CONFIG_OVERLAY_FS_METACOPY is not set
>> # CONFIG_OVERLAY_FS_DEBUG is not set
>>
>> #
>> # Caches
>> #
>> CONFIG_NETFS_SUPPORT=y
>> # CONFIG_FSCACHE is not set
>> # end of Caches
>>
>> #
>> # Pseudo filesystems
>> #
>> # CONFIG_PROC_FS is not set
>> CONFIG_KERNFS=y
>> CONFIG_SYSFS=y
>> # CONFIG_HUGETLBFS is not set
>> CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
>> CONFIG_CONFIGFS_FS=y
>> # end of Pseudo filesystems
>>
>> # CONFIG_MISC_FILESYSTEMS is not set
>> # CONFIG_NETWORK_FILESYSTEMS is not set
>> CONFIG_NLS=y
>> CONFIG_NLS_DEFAULT="iso8859-1"
>> CONFIG_NLS_CODEPAGE_437=y
>> CONFIG_NLS_CODEPAGE_737=y
>> # CONFIG_NLS_CODEPAGE_775 is not set
>> CONFIG_NLS_CODEPAGE_850=y
>> CONFIG_NLS_CODEPAGE_852=y
>> CONFIG_NLS_CODEPAGE_855=y
>> CONFIG_NLS_CODEPAGE_857=y
>> CONFIG_NLS_CODEPAGE_860=y
>> CONFIG_NLS_CODEPAGE_861=y
>> CONFIG_NLS_CODEPAGE_862=y
>> CONFIG_NLS_CODEPAGE_863=y
>> CONFIG_NLS_CODEPAGE_864=y
>> CONFIG_NLS_CODEPAGE_865=y
>> # CONFIG_NLS_CODEPAGE_866 is not set
>> # CONFIG_NLS_CODEPAGE_869 is not set
>> CONFIG_NLS_CODEPAGE_936=y
>> # CONFIG_NLS_CODEPAGE_950 is not set
>> CONFIG_NLS_CODEPAGE_932=y
>> # CONFIG_NLS_CODEPAGE_949 is not set
>> CONFIG_NLS_CODEPAGE_874=y
>> CONFIG_NLS_ISO8859_8=y
>> CONFIG_NLS_CODEPAGE_1250=y
>> CONFIG_NLS_CODEPAGE_1251=y
>> CONFIG_NLS_ASCII=y
>> CONFIG_NLS_ISO8859_1=y
>> # CONFIG_NLS_ISO8859_2 is not set
>> # CONFIG_NLS_ISO8859_3 is not set
>> CONFIG_NLS_ISO8859_4=y
>> # CONFIG_NLS_ISO8859_5 is not set
>> # CONFIG_NLS_ISO8859_6 is not set
>> CONFIG_NLS_ISO8859_7=y
>> CONFIG_NLS_ISO8859_9=y
>> CONFIG_NLS_ISO8859_13=y
>> CONFIG_NLS_ISO8859_14=y
>> CONFIG_NLS_ISO8859_15=y
>> CONFIG_NLS_KOI8_R=y
>> CONFIG_NLS_KOI8_U=y
>> # CONFIG_NLS_MAC_ROMAN is not set
>> # CONFIG_NLS_MAC_CELTIC is not set
>> # CONFIG_NLS_MAC_CENTEURO is not set
>> # CONFIG_NLS_MAC_CROATIAN is not set
>> # CONFIG_NLS_MAC_CYRILLIC is not set
>> # CONFIG_NLS_MAC_GAELIC is not set
>> CONFIG_NLS_MAC_GREEK=y
>> # CONFIG_NLS_MAC_ICELAND is not set
>> # CONFIG_NLS_MAC_INUIT is not set
>> # CONFIG_NLS_MAC_ROMANIAN is not set
>> # CONFIG_NLS_MAC_TURKISH is not set
>> CONFIG_NLS_UTF8=y
>> CONFIG_UNICODE=y
>> CONFIG_UNICODE_NORMALIZATION_SELFTEST=y
>> # end of File systems
>>
>> #
>> # Security options
>> #
>> CONFIG_KEYS=y
>> # CONFIG_KEYS_REQUEST_CACHE is not set
>> # CONFIG_PERSISTENT_KEYRINGS is not set
>> CONFIG_TRUSTED_KEYS=y
>> # CONFIG_TRUSTED_KEYS_TPM is not set
>>
>> #
>> # No trust source selected!
>> #
>> CONFIG_ENCRYPTED_KEYS=y
>> # CONFIG_USER_DECRYPTED_DATA is not set
>> CONFIG_KEY_DH_OPERATIONS=y
>> # CONFIG_KEY_NOTIFICATIONS is not set
>> CONFIG_SECURITY_DMESG_RESTRICT=y
>> # CONFIG_SECURITY is not set
>> CONFIG_SECURITYFS=y
>> # CONFIG_HARDENED_USERCOPY is not set
>> # CONFIG_FORTIFY_SOURCE is not set
>> # CONFIG_STATIC_USERMODEHELPER is not set
>> CONFIG_DEFAULT_SECURITY_DAC=y
>> CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,bpf"
>>
>> #
>> # Kernel hardening options
>> #
>>
>> #
>> # Memory initialization
>> #
>> CONFIG_INIT_STACK_NONE=y
>> CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
>> CONFIG_INIT_ON_FREE_DEFAULT_ON=y
>> CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
>> # CONFIG_ZERO_CALL_USED_REGS is not set
>> # end of Memory initialization
>>
>> #
>> # Hardening of kernel data structures
>> #
>> CONFIG_LIST_HARDENED=y
>> CONFIG_BUG_ON_DATA_CORRUPTION=y
>> # end of Hardening of kernel data structures
>>
>> CONFIG_RANDSTRUCT_NONE=y
>> # end of Kernel hardening options
>> # end of Security options
>>
>> CONFIG_CRYPTO=y
>>
>> #
>> # Crypto core or helper
>> #
>> CONFIG_CRYPTO_ALGAPI=y
>> CONFIG_CRYPTO_ALGAPI2=y
>> CONFIG_CRYPTO_AEAD=y
>> CONFIG_CRYPTO_AEAD2=y
>> CONFIG_CRYPTO_SIG=y
>> CONFIG_CRYPTO_SIG2=y
>> CONFIG_CRYPTO_SKCIPHER=y
>> CONFIG_CRYPTO_SKCIPHER2=y
>> CONFIG_CRYPTO_HASH=y
>> CONFIG_CRYPTO_HASH2=y
>> CONFIG_CRYPTO_RNG=y
>> CONFIG_CRYPTO_RNG2=y
>> CONFIG_CRYPTO_RNG_DEFAULT=y
>> CONFIG_CRYPTO_AKCIPHER2=y
>> CONFIG_CRYPTO_AKCIPHER=y
>> CONFIG_CRYPTO_KPP2=y
>> CONFIG_CRYPTO_KPP=y
>> CONFIG_CRYPTO_ACOMP2=y
>> CONFIG_CRYPTO_MANAGER=y
>> CONFIG_CRYPTO_MANAGER2=y
>> # CONFIG_CRYPTO_USER is not set
>> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
>> CONFIG_CRYPTO_NULL=y
>> CONFIG_CRYPTO_NULL2=y
>> # CONFIG_CRYPTO_PCRYPT is not set
>> CONFIG_CRYPTO_CRYPTD=y
>> CONFIG_CRYPTO_AUTHENC=y
>> # CONFIG_CRYPTO_TEST is not set
>> CONFIG_CRYPTO_SIMD=y
>> # end of Crypto core or helper
>>
>> #
>> # Public-key cryptography
>> #
>> CONFIG_CRYPTO_RSA=y
>> CONFIG_CRYPTO_DH=y
>> CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
>> CONFIG_CRYPTO_ECC=y
>> CONFIG_CRYPTO_ECDH=y
>> CONFIG_CRYPTO_ECDSA=y
>> # CONFIG_CRYPTO_ECRDSA is not set
>> CONFIG_CRYPTO_SM2=y
>> # CONFIG_CRYPTO_CURVE25519 is not set
>> # end of Public-key cryptography
>>
>> #
>> # Block ciphers
>> #
>> CONFIG_CRYPTO_AES=y
>> CONFIG_CRYPTO_AES_TI=y
>> CONFIG_CRYPTO_ARIA=y
>> CONFIG_CRYPTO_BLOWFISH=y
>> CONFIG_CRYPTO_BLOWFISH_COMMON=y
>> CONFIG_CRYPTO_CAMELLIA=y
>> CONFIG_CRYPTO_CAST_COMMON=y
>> CONFIG_CRYPTO_CAST5=y
>> # CONFIG_CRYPTO_CAST6 is not set
>> CONFIG_CRYPTO_DES=y
>> # CONFIG_CRYPTO_FCRYPT is not set
>> CONFIG_CRYPTO_SERPENT=y
>> CONFIG_CRYPTO_SM4=y
>> CONFIG_CRYPTO_SM4_GENERIC=y
>> CONFIG_CRYPTO_TWOFISH=y
>> CONFIG_CRYPTO_TWOFISH_COMMON=y
>> # end of Block ciphers
>>
>> #
>> # Length-preserving ciphers and modes
>> #
>> CONFIG_CRYPTO_ADIANTUM=y
>> CONFIG_CRYPTO_CHACHA20=y
>> CONFIG_CRYPTO_CBC=y
>> CONFIG_CRYPTO_CTR=y
>> # CONFIG_CRYPTO_CTS is not set
>> CONFIG_CRYPTO_ECB=y
>> # CONFIG_CRYPTO_HCTR2 is not set
>> # CONFIG_CRYPTO_KEYWRAP is not set
>> CONFIG_CRYPTO_LRW=y
>> CONFIG_CRYPTO_PCBC=y
>> CONFIG_CRYPTO_XTS=y
>> CONFIG_CRYPTO_NHPOLY1305=y
>> # end of Length-preserving ciphers and modes
>>
>> #
>> # AEAD (authenticated encryption with associated data) ciphers
>> #
>> CONFIG_CRYPTO_AEGIS128=y
>> CONFIG_CRYPTO_CHACHA20POLY1305=y
>> # CONFIG_CRYPTO_CCM is not set
>> CONFIG_CRYPTO_GCM=y
>> CONFIG_CRYPTO_GENIV=y
>> CONFIG_CRYPTO_SEQIV=y
>> CONFIG_CRYPTO_ECHAINIV=y
>> # CONFIG_CRYPTO_ESSIV is not set
>> # end of AEAD (authenticated encryption with associated data) ciphers
>>
>> #
>> # Hashes, digests, and MACs
>> #
>> # CONFIG_CRYPTO_BLAKE2B is not set
>> CONFIG_CRYPTO_CMAC=y
>> CONFIG_CRYPTO_GHASH=y
>> CONFIG_CRYPTO_HMAC=y
>> CONFIG_CRYPTO_MD4=y
>> CONFIG_CRYPTO_MD5=y
>> CONFIG_CRYPTO_MICHAEL_MIC=y
>> CONFIG_CRYPTO_POLYVAL=y
>> CONFIG_CRYPTO_POLY1305=y
>> # CONFIG_CRYPTO_RMD160 is not set
>> CONFIG_CRYPTO_SHA1=y
>> CONFIG_CRYPTO_SHA256=y
>> CONFIG_CRYPTO_SHA512=y
>> CONFIG_CRYPTO_SHA3=y
>> CONFIG_CRYPTO_SM3=y
>> CONFIG_CRYPTO_SM3_GENERIC=y
>> CONFIG_CRYPTO_STREEBOG=y
>> CONFIG_CRYPTO_VMAC=y
>> CONFIG_CRYPTO_WP512=y
>> # CONFIG_CRYPTO_XCBC is not set
>> CONFIG_CRYPTO_XXHASH=y
>> # end of Hashes, digests, and MACs
>>
>> #
>> # CRCs (cyclic redundancy checks)
>> #
>> CONFIG_CRYPTO_CRC32C=y
>> CONFIG_CRYPTO_CRC32=y
>> # CONFIG_CRYPTO_CRCT10DIF is not set
>> CONFIG_CRYPTO_CRC64_ROCKSOFT=y
>> # end of CRCs (cyclic redundancy checks)
>>
>> #
>> # Compression
>> #
>> # CONFIG_CRYPTO_DEFLATE is not set
>> CONFIG_CRYPTO_LZO=y
>> # CONFIG_CRYPTO_842 is not set
>> CONFIG_CRYPTO_LZ4=y
>> CONFIG_CRYPTO_LZ4HC=y
>> CONFIG_CRYPTO_ZSTD=y
>> # end of Compression
>>
>> #
>> # Random number generation
>> #
>> # CONFIG_CRYPTO_ANSI_CPRNG is not set
>> CONFIG_CRYPTO_DRBG_MENU=y
>> CONFIG_CRYPTO_DRBG_HMAC=y
>> CONFIG_CRYPTO_DRBG_HASH=y
>> CONFIG_CRYPTO_DRBG_CTR=y
>> CONFIG_CRYPTO_DRBG=y
>> CONFIG_CRYPTO_JITTERENTROPY=y
>> CONFIG_CRYPTO_JITTERENTROPY_MEMORY_BLOCKS=64
>> CONFIG_CRYPTO_JITTERENTROPY_MEMORY_BLOCKSIZE=32
>> CONFIG_CRYPTO_JITTERENTROPY_OSR=1
>> CONFIG_CRYPTO_KDF800108_CTR=y
>> # end of Random number generation
>>
>> #
>> # Userspace interface
>> #
>> CONFIG_CRYPTO_USER_API=y
>> CONFIG_CRYPTO_USER_API_HASH=y
>> CONFIG_CRYPTO_USER_API_SKCIPHER=y
>> CONFIG_CRYPTO_USER_API_RNG=y
>> # CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
>> CONFIG_CRYPTO_USER_API_AEAD=y
>> # CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is not set
>> # end of Userspace interface
>>
>> CONFIG_CRYPTO_HASH_INFO=y
>>
>> #
>> # Accelerated Cryptographic Algorithms for CPU (x86)
>> #
>> CONFIG_CRYPTO_CURVE25519_X86=y
>> CONFIG_CRYPTO_AES_NI_INTEL=y
>> CONFIG_CRYPTO_BLOWFISH_X86_64=y
>> CONFIG_CRYPTO_CAMELLIA_X86_64=y
>> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=y
>> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=y
>> CONFIG_CRYPTO_CAST5_AVX_X86_64=y
>> # CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
>> CONFIG_CRYPTO_DES3_EDE_X86_64=y
>> CONFIG_CRYPTO_SERPENT_SSE2_X86_64=y
>> # CONFIG_CRYPTO_SERPENT_AVX_X86_64 is not set
>> # CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
>> CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64=y
>> CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64=y
>> CONFIG_CRYPTO_TWOFISH_X86_64=y
>> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=y
>> # CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set
>> CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64=y
>> CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64=y
>> # CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64 is not set
>> CONFIG_CRYPTO_CHACHA20_X86_64=y
>> CONFIG_CRYPTO_AEGIS128_AESNI_SSE2=y
>> CONFIG_CRYPTO_NHPOLY1305_SSE2=y
>> # CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
>> CONFIG_CRYPTO_BLAKE2S_X86=y
>> CONFIG_CRYPTO_POLYVAL_CLMUL_NI=y
>> CONFIG_CRYPTO_POLY1305_X86_64=y
>> # CONFIG_CRYPTO_SHA1_SSSE3 is not set
>> CONFIG_CRYPTO_SHA256_SSSE3=y
>> CONFIG_CRYPTO_SHA512_SSSE3=y
>> # CONFIG_CRYPTO_SM3_AVX_X86_64 is not set
>> # CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
>> CONFIG_CRYPTO_CRC32C_INTEL=y
>> CONFIG_CRYPTO_CRC32_PCLMUL=y
>> # end of Accelerated Cryptographic Algorithms for CPU (x86)
>>
>> # CONFIG_CRYPTO_HW is not set
>> CONFIG_ASYMMETRIC_KEY_TYPE=y
>> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
>> CONFIG_X509_CERTIFICATE_PARSER=y
>> CONFIG_PKCS8_PRIVATE_KEY_PARSER=y
>> CONFIG_PKCS7_MESSAGE_PARSER=y
>> # CONFIG_FIPS_SIGNATURE_SELFTEST is not set
>>
>> #
>> # Certificates for signature checking
>> #
>> # CONFIG_SYSTEM_TRUSTED_KEYRING is not set
>> # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
>> # end of Certificates for signature checking
>>
>> CONFIG_BINARY_PRINTF=y
>>
>> #
>> # Library routines
>> #
>> CONFIG_LINEAR_RANGES=y
>> # CONFIG_PACKING is not set
>> CONFIG_BITREVERSE=y
>> CONFIG_GENERIC_STRNCPY_FROM_USER=y
>> CONFIG_GENERIC_STRNLEN_USER=y
>> CONFIG_GENERIC_NET_UTILS=y
>> CONFIG_CORDIC=y
>> # CONFIG_PRIME_NUMBERS is not set
>> CONFIG_RATIONAL=y
>> CONFIG_GENERIC_IOMAP=y
>> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
>> CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
>> CONFIG_ARCH_USE_SYM_ANNOTATIONS=y
>>
>> #
>> # Crypto library routines
>> #
>> CONFIG_CRYPTO_LIB_UTILS=y
>> CONFIG_CRYPTO_LIB_AES=y
>> CONFIG_CRYPTO_LIB_AESCFB=y
>> CONFIG_CRYPTO_LIB_ARC4=y
>> CONFIG_CRYPTO_LIB_GF128MUL=y
>> CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S=y
>> CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
>> CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=y
>> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
>> # CONFIG_CRYPTO_LIB_CHACHA is not set
>> CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519=y
>> CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
>> CONFIG_CRYPTO_LIB_CURVE25519=y
>> CONFIG_CRYPTO_LIB_DES=y
>> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
>> CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=y
>> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
>> CONFIG_CRYPTO_LIB_POLY1305=y
>> # CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
>> CONFIG_CRYPTO_LIB_SHA1=y
>> CONFIG_CRYPTO_LIB_SHA256=y
>> # end of Crypto library routines
>>
>> CONFIG_CRC_CCITT=y
>> CONFIG_CRC16=y
>> # CONFIG_CRC_T10DIF is not set
>> CONFIG_CRC64_ROCKSOFT=y
>> CONFIG_CRC_ITU_T=y
>> CONFIG_CRC32=y
>> CONFIG_CRC32_SELFTEST=y
>> # CONFIG_CRC32_SLICEBY8 is not set
>> # CONFIG_CRC32_SLICEBY4 is not set
>> CONFIG_CRC32_SARWATE=y
>> # CONFIG_CRC32_BIT is not set
>> CONFIG_CRC64=y
>> # CONFIG_CRC4 is not set
>> CONFIG_CRC7=y
>> CONFIG_LIBCRC32C=y
>> CONFIG_CRC8=y
>> CONFIG_XXHASH=y
>> # CONFIG_RANDOM32_SELFTEST is not set
>> CONFIG_ZLIB_INFLATE=y
>> CONFIG_ZLIB_DEFLATE=y
>> CONFIG_LZO_COMPRESS=y
>> CONFIG_LZO_DECOMPRESS=y
>> CONFIG_LZ4_COMPRESS=y
>> CONFIG_LZ4HC_COMPRESS=y
>> CONFIG_LZ4_DECOMPRESS=y
>> CONFIG_ZSTD_COMMON=y
>> CONFIG_ZSTD_COMPRESS=y
>> CONFIG_ZSTD_DECOMPRESS=y
>> CONFIG_XZ_DEC=y
>> CONFIG_XZ_DEC_X86=y
>> CONFIG_XZ_DEC_POWERPC=y
>> CONFIG_XZ_DEC_ARM=y
>> CONFIG_XZ_DEC_ARMTHUMB=y
>> # CONFIG_XZ_DEC_SPARC is not set
>> # CONFIG_XZ_DEC_MICROLZMA is not set
>> CONFIG_XZ_DEC_BCJ=y
>> # CONFIG_XZ_DEC_TEST is not set
>> CONFIG_GENERIC_ALLOCATOR=y
>> CONFIG_REED_SOLOMON=y
>> CONFIG_REED_SOLOMON_ENC16=y
>> CONFIG_REED_SOLOMON_DEC16=y
>> CONFIG_BCH=y
>> CONFIG_INTERVAL_TREE=y
>> CONFIG_XARRAY_MULTI=y
>> CONFIG_ASSOCIATIVE_ARRAY=y
>> CONFIG_HAS_IOMEM=y
>> CONFIG_HAS_IOPORT=y
>> CONFIG_HAS_IOPORT_MAP=y
>> CONFIG_HAS_DMA=y
>> CONFIG_NEED_SG_DMA_LENGTH=y
>> CONFIG_NEED_DMA_MAP_STATE=y
>> CONFIG_ARCH_DMA_ADDR_T_64BIT=y
>> CONFIG_DMA_DECLARE_COHERENT=y
>> CONFIG_SWIOTLB=y
>> # CONFIG_SWIOTLB_DYNAMIC is not set
>> CONFIG_DMA_NEED_SYNC=y
>> CONFIG_DMA_RESTRICTED_POOL=y
>> CONFIG_DMA_CMA=y
>>
>> #
>> # Default contiguous memory area size:
>> #
>> CONFIG_CMA_SIZE_MBYTES=0
>> CONFIG_CMA_SIZE_PERCENTAGE=0
>> # CONFIG_CMA_SIZE_SEL_MBYTES is not set
>> # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
>> CONFIG_CMA_SIZE_SEL_MIN=y
>> # CONFIG_CMA_SIZE_SEL_MAX is not set
>> CONFIG_CMA_ALIGNMENT=8
>> # CONFIG_DMA_API_DEBUG is not set
>> CONFIG_DMA_MAP_BENCHMARK=y
>> CONFIG_SGL_ALLOC=y
>> CONFIG_CPUMASK_OFFSTACK=y
>> CONFIG_CPU_RMAP=y
>> CONFIG_GLOB=y
>> CONFIG_GLOB_SELFTEST=y
>> CONFIG_NLATTR=y
>> CONFIG_CLZ_TAB=y
>> # CONFIG_IRQ_POLL is not set
>> CONFIG_MPILIB=y
>> CONFIG_LIBFDT=y
>> CONFIG_OID_REGISTRY=y
>> CONFIG_HAVE_GENERIC_VDSO=y
>> CONFIG_GENERIC_GETTIMEOFDAY=y
>> CONFIG_GENERIC_VDSO_TIME_NS=y
>> CONFIG_GENERIC_VDSO_OVERFLOW_PROTECT=y
>> CONFIG_ARCH_HAS_PMEM_API=y
>> CONFIG_ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION=y
>> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
>> CONFIG_ARCH_HAS_COPY_MC=y
>> CONFIG_ARCH_STACKWALK=y
>> CONFIG_STACKDEPOT=y
>> CONFIG_STACKDEPOT_MAX_FRAMES=64
>> CONFIG_REF_TRACKER=y
>> # CONFIG_LWQ_TEST is not set
>> # end of Library routines
>>
>> #
>> # Kernel hacking
>> #
>>
>> #
>> # printk and dmesg options
>> #
>> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
>> CONFIG_CONSOLE_LOGLEVEL_QUIET=4
>> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
>> CONFIG_SYMBOLIC_ERRNAME=y
>> # end of printk and dmesg options
>>
>> CONFIG_DEBUG_KERNEL=y
>> # CONFIG_DEBUG_MISC is not set
>>
>> #
>> # Compile-time checks and compiler options
>> #
>> CONFIG_DEBUG_INFO=y
>> CONFIG_AS_HAS_NON_CONST_ULEB128=y
>> # CONFIG_DEBUG_INFO_NONE is not set
>> # CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
>> CONFIG_DEBUG_INFO_DWARF4=y
>> # CONFIG_DEBUG_INFO_DWARF5 is not set
>> # CONFIG_DEBUG_INFO_REDUCED is not set
>> CONFIG_DEBUG_INFO_COMPRESSED_NONE=y
>> # CONFIG_DEBUG_INFO_COMPRESSED_ZLIB is not set
>> # CONFIG_DEBUG_INFO_SPLIT is not set
>> CONFIG_DEBUG_INFO_BTF=y
>> CONFIG_PAHOLE_HAS_SPLIT_BTF=y
>> CONFIG_PAHOLE_HAS_LANG_EXCLUDE=y
>> CONFIG_GDB_SCRIPTS=y
>> CONFIG_FRAME_WARN=2048
>> CONFIG_STRIP_ASM_SYMS=y
>> # CONFIG_READABLE_ASM is not set
>> CONFIG_HEADERS_INSTALL=y
>> # CONFIG_DEBUG_SECTION_MISMATCH is not set
>> # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>> # CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
>> CONFIG_ARCH_WANT_FRAME_POINTERS=y
>> CONFIG_FRAME_POINTER=y
>> CONFIG_OBJTOOL=y
>> CONFIG_STACK_VALIDATION=y
>> # CONFIG_VMLINUX_MAP is not set
>> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
>> # end of Compile-time checks and compiler options
>>
>> #
>> # Generic Kernel Debugging Instruments
>> #
>> CONFIG_MAGIC_SYSRQ=y
>> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
>> # CONFIG_MAGIC_SYSRQ_SERIAL is not set
>> CONFIG_DEBUG_FS=y
>> # CONFIG_DEBUG_FS_ALLOW_ALL is not set
>> CONFIG_DEBUG_FS_DISALLOW_MOUNT=y
>> # CONFIG_DEBUG_FS_ALLOW_NONE is not set
>> CONFIG_HAVE_ARCH_KGDB=y
>> CONFIG_KGDB=y
>> CONFIG_KGDB_TESTS=y
>> CONFIG_KGDB_TESTS_ON_BOOT=y
>> CONFIG_KGDB_TESTS_BOOT_STRING="V1F100"
>> # CONFIG_KGDB_LOW_LEVEL_TRAP is not set
>> CONFIG_KGDB_KDB=y
>> CONFIG_KDB_DEFAULT_ENABLE=0x1
>> CONFIG_KDB_CONTINUE_CATASTROPHIC=0
>> CONFIG_ARCH_HAS_EARLY_DEBUG=y
>> CONFIG_ARCH_HAS_UBSAN=y
>> CONFIG_UBSAN=y
>> # CONFIG_UBSAN_TRAP is not set
>> CONFIG_CC_HAS_UBSAN_BOUNDS_STRICT=y
>> CONFIG_UBSAN_BOUNDS=y
>> CONFIG_UBSAN_BOUNDS_STRICT=y
>> # CONFIG_UBSAN_SHIFT is not set
>> CONFIG_UBSAN_DIV_ZERO=y
>> CONFIG_UBSAN_SIGNED_WRAP=y
>> CONFIG_UBSAN_BOOL=y
>> # CONFIG_UBSAN_ENUM is not set
>> CONFIG_UBSAN_ALIGNMENT=y
>> CONFIG_HAVE_ARCH_KCSAN=y
>> CONFIG_HAVE_KCSAN_COMPILER=y
>> # CONFIG_KCSAN is not set
>> # end of Generic Kernel Debugging Instruments
>>
>> #
>> # Networking Debugging
>> #
>> CONFIG_NET_DEV_REFCNT_TRACKER=y
>> CONFIG_NET_NS_REFCNT_TRACKER=y
>> CONFIG_DEBUG_NET=y
>> # end of Networking Debugging
>>
>> #
>> # Memory Debugging
>> #
>> CONFIG_PAGE_EXTENSION=y
>> CONFIG_DEBUG_PAGEALLOC=y
>> # CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
>> # CONFIG_PAGE_OWNER is not set
>> # CONFIG_PAGE_TABLE_CHECK is not set
>> CONFIG_PAGE_POISONING=y
>> # CONFIG_DEBUG_PAGE_REF is not set
>> # CONFIG_DEBUG_RODATA_TEST is not set
>> CONFIG_ARCH_HAS_DEBUG_WX=y
>> # CONFIG_DEBUG_WX is not set
>> CONFIG_GENERIC_PTDUMP=y
>> # CONFIG_PTDUMP_DEBUGFS is not set
>> CONFIG_HAVE_DEBUG_KMEMLEAK=y
>> # CONFIG_DEBUG_KMEMLEAK is not set
>> # CONFIG_PER_VMA_LOCK_STATS is not set
>> # CONFIG_DEBUG_OBJECTS is not set
>> # CONFIG_SHRINKER_DEBUG is not set
>> # CONFIG_DEBUG_STACK_USAGE is not set
>> # CONFIG_SCHED_STACK_END_CHECK is not set
>> CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
>> CONFIG_DEBUG_VM_IRQSOFF=y
>> CONFIG_DEBUG_VM=y
>> # CONFIG_DEBUG_VM_MAPLE_TREE is not set
>> CONFIG_DEBUG_VM_RB=y
>> # CONFIG_DEBUG_VM_PGFLAGS is not set
>> CONFIG_DEBUG_VM_PGTABLE=y
>> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
>> # CONFIG_DEBUG_VIRTUAL is not set
>> # CONFIG_DEBUG_MEMORY_INIT is not set
>> # CONFIG_DEBUG_PER_CPU_MAPS is not set
>> CONFIG_HAVE_ARCH_KASAN=y
>> CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
>> CONFIG_CC_HAS_KASAN_GENERIC=y
>> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
>> CONFIG_HAVE_ARCH_KFENCE=y
>> # CONFIG_KFENCE is not set
>> CONFIG_HAVE_ARCH_KMSAN=y
>> # end of Memory Debugging
>>
>> CONFIG_DEBUG_SHIRQ=y
>>
>> #
>> # Debug Oops, Lockups and Hangs
>> #
>> CONFIG_PANIC_ON_OOPS=y
>> CONFIG_PANIC_ON_OOPS_VALUE=1
>> CONFIG_PANIC_TIMEOUT=0
>> # CONFIG_SOFTLOCKUP_DETECTOR is not set
>> CONFIG_HAVE_HARDLOCKUP_DETECTOR_BUDDY=y
>> # CONFIG_HARDLOCKUP_DETECTOR is not set
>> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
>> CONFIG_DETECT_HUNG_TASK=y
>> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
>> # CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
>> CONFIG_WQ_WATCHDOG=y
>> # CONFIG_WQ_CPU_INTENSIVE_REPORT is not set
>> # end of Debug Oops, Lockups and Hangs
>>
>> #
>> # Scheduler Debugging
>> #
>> CONFIG_SCHED_DEBUG=y
>> # end of Scheduler Debugging
>>
>> # CONFIG_DEBUG_TIMEKEEPING is not set
>> # CONFIG_DEBUG_PREEMPT is not set
>>
>> #
>> # Lock Debugging (spinlocks, mutexes, etc...)
>> #
>> CONFIG_LOCK_DEBUGGING_SUPPORT=y
>> CONFIG_PROVE_LOCKING=y
>> CONFIG_PROVE_RAW_LOCK_NESTING=y
>> # CONFIG_LOCK_STAT is not set
>> CONFIG_DEBUG_RT_MUTEXES=y
>> CONFIG_DEBUG_SPINLOCK=y
>> CONFIG_DEBUG_MUTEXES=y
>> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
>> CONFIG_DEBUG_RWSEMS=y
>> CONFIG_DEBUG_LOCK_ALLOC=y
>> CONFIG_LOCKDEP=y
>> CONFIG_LOCKDEP_BITS=15
>> CONFIG_LOCKDEP_CHAINS_BITS=16
>> CONFIG_LOCKDEP_STACK_TRACE_BITS=19
>> CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
>> CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
>> # CONFIG_DEBUG_LOCKDEP is not set
>> CONFIG_DEBUG_ATOMIC_SLEEP=y
>> CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
>> CONFIG_LOCK_TORTURE_TEST=y
>> CONFIG_WW_MUTEX_SELFTEST=y
>> CONFIG_SCF_TORTURE_TEST=y
>> CONFIG_CSD_LOCK_WAIT_DEBUG=y
>> CONFIG_CSD_LOCK_WAIT_DEBUG_DEFAULT=y
>> # end of Lock Debugging (spinlocks, mutexes, etc...)
>>
>> CONFIG_TRACE_IRQFLAGS=y
>> CONFIG_TRACE_IRQFLAGS_NMI=y
>> CONFIG_NMI_CHECK_CPU=y
>> # CONFIG_DEBUG_IRQFLAGS is not set
>> CONFIG_STACKTRACE=y
>> CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
>> # CONFIG_DEBUG_KOBJECT is not set
>>
>> #
>> # Debug kernel data structures
>> #
>> # CONFIG_DEBUG_LIST is not set
>> CONFIG_DEBUG_PLIST=y
>> CONFIG_DEBUG_SG=y
>> CONFIG_DEBUG_NOTIFIERS=y
>> CONFIG_DEBUG_MAPLE_TREE=y
>> # end of Debug kernel data structures
>>
>> #
>> # RCU Debugging
>> #
>> CONFIG_PROVE_RCU=y
>> CONFIG_PROVE_RCU_LIST=y
>> CONFIG_TORTURE_TEST=y
>> # CONFIG_RCU_SCALE_TEST is not set
>> CONFIG_RCU_TORTURE_TEST=y
>> # CONFIG_RCU_REF_SCALE_TEST is not set
>> CONFIG_RCU_CPU_STALL_TIMEOUT=21
>> CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
>> # CONFIG_RCU_CPU_STALL_CPUTIME is not set
>> CONFIG_RCU_CPU_STALL_NOTIFIER=y
>> CONFIG_RCU_TRACE=y
>> # CONFIG_RCU_EQS_DEBUG is not set
>> # end of RCU Debugging
>>
>> CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
>> CONFIG_CPU_HOTPLUG_STATE_CONTROL=y
>> CONFIG_USER_STACKTRACE_SUPPORT=y
>> CONFIG_NOP_TRACER=y
>> CONFIG_HAVE_RETHOOK=y
>> CONFIG_RETHOOK=y
>> CONFIG_HAVE_FUNCTION_TRACER=y
>> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
>> CONFIG_HAVE_FUNCTION_GRAPH_RETVAL=y
>> CONFIG_HAVE_DYNAMIC_FTRACE=y
>> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
>> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
>> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
>> CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE=y
>> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
>> CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
>> CONFIG_HAVE_FENTRY=y
>> CONFIG_HAVE_OBJTOOL_MCOUNT=y
>> CONFIG_HAVE_OBJTOOL_NOP_MCOUNT=y
>> CONFIG_HAVE_C_RECORDMCOUNT=y
>> CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
>> CONFIG_BUILDTIME_MCOUNT_SORT=y
>> CONFIG_TRACER_MAX_TRACE=y
>> CONFIG_TRACE_CLOCK=y
>> CONFIG_RING_BUFFER=y
>> CONFIG_EVENT_TRACING=y
>> CONFIG_CONTEXT_SWITCH_TRACER=y
>> CONFIG_RING_BUFFER_ALLOW_SWAP=y
>> CONFIG_PREEMPTIRQ_TRACEPOINTS=y
>> CONFIG_TRACING=y
>> CONFIG_GENERIC_TRACER=y
>> CONFIG_TRACING_SUPPORT=y
>> CONFIG_FTRACE=y
>> # CONFIG_BOOTTIME_TRACING is not set
>> CONFIG_FUNCTION_TRACER=y
>> CONFIG_FUNCTION_GRAPH_TRACER=y
>> # CONFIG_FUNCTION_GRAPH_RETVAL is not set
>> CONFIG_DYNAMIC_FTRACE=y
>> CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
>> CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
>> CONFIG_DYNAMIC_FTRACE_WITH_ARGS=y
>> CONFIG_FPROBE=y
>> CONFIG_FUNCTION_PROFILER=y
>> CONFIG_STACK_TRACER=y
>> CONFIG_TRACE_PREEMPT_TOGGLE=y
>> CONFIG_IRQSOFF_TRACER=y
>> CONFIG_PREEMPT_TRACER=y
>> CONFIG_SCHED_TRACER=y
>> CONFIG_HWLAT_TRACER=y
>> # CONFIG_OSNOISE_TRACER is not set
>> # CONFIG_TIMERLAT_TRACER is not set
>> CONFIG_FTRACE_SYSCALLS=y
>> CONFIG_TRACER_SNAPSHOT=y
>> CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=y
>> CONFIG_TRACE_BRANCH_PROFILING=y
>> # CONFIG_BRANCH_PROFILE_NONE is not set
>> CONFIG_PROFILE_ANNOTATED_BRANCHES=y
>> # CONFIG_PROFILE_ALL_BRANCHES is not set
>> # CONFIG_BRANCH_TRACER is not set
>> # CONFIG_FPROBE_EVENTS is not set
>> CONFIG_PROBE_EVENTS_BTF_ARGS=y
>> CONFIG_KPROBE_EVENTS=y
>> # CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
>> CONFIG_UPROBE_EVENTS=y
>> CONFIG_BPF_EVENTS=y
>> CONFIG_DYNAMIC_EVENTS=y
>> CONFIG_PROBE_EVENTS=y
>> CONFIG_BPF_KPROBE_OVERRIDE=y
>> CONFIG_FTRACE_MCOUNT_RECORD=y
>> CONFIG_FTRACE_MCOUNT_USE_CC=y
>> CONFIG_SYNTH_EVENTS=y
>> # CONFIG_USER_EVENTS is not set
>> # CONFIG_HIST_TRIGGERS is not set
>> # CONFIG_TRACE_EVENT_INJECT is not set
>> # CONFIG_TRACEPOINT_BENCHMARK is not set
>> CONFIG_RING_BUFFER_BENCHMARK=y
>> CONFIG_TRACE_EVAL_MAP_FILE=y
>> # CONFIG_FTRACE_RECORD_RECURSION is not set
>> # CONFIG_FTRACE_VALIDATE_RCU_IS_WATCHING is not set
>> # CONFIG_FTRACE_STARTUP_TEST is not set
>> # CONFIG_FTRACE_SORT_STARTUP_TEST is not set
>> CONFIG_RING_BUFFER_STARTUP_TEST=y
>> CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS=y
>> CONFIG_DA_MON_EVENTS=y
>> CONFIG_DA_MON_EVENTS_IMPLICIT=y
>> CONFIG_DA_MON_EVENTS_ID=y
>> CONFIG_RV=y
>> CONFIG_RV_MON_WIP=y
>> CONFIG_RV_MON_WWNR=y
>> CONFIG_RV_REACTORS=y
>> CONFIG_RV_REACT_PRINTK=y
>> CONFIG_RV_REACT_PANIC=y
>> # CONFIG_SAMPLES is not set
>> CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
>> CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
>> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
>>
>> #
>> # x86 Debugging
>> #
>> CONFIG_X86_VERBOSE_BOOTUP=y
>> # CONFIG_EARLY_PRINTK is not set
>> CONFIG_DEBUG_TLBFLUSH=y
>> CONFIG_HAVE_MMIOTRACE_SUPPORT=y
>> CONFIG_X86_DECODER_SELFTEST=y
>> # CONFIG_IO_DELAY_0X80 is not set
>> # CONFIG_IO_DELAY_0XED is not set
>> CONFIG_IO_DELAY_UDELAY=y
>> # CONFIG_IO_DELAY_NONE is not set
>> CONFIG_DEBUG_BOOT_PARAMS=y
>> # CONFIG_CPA_DEBUG is not set
>> # CONFIG_DEBUG_ENTRY is not set
>> # CONFIG_DEBUG_NMI_SELFTEST is not set
>> # CONFIG_X86_DEBUG_FPU is not set
>> # CONFIG_UNWINDER_ORC is not set
>> CONFIG_UNWINDER_FRAME_POINTER=y
>> # end of x86 Debugging
>>
>> #
>> # Kernel Testing and Coverage
>> #
>> CONFIG_KUNIT=y
>> CONFIG_KUNIT_DEBUGFS=y
>> # CONFIG_KUNIT_TEST is not set
>> CONFIG_KUNIT_EXAMPLE_TEST=y
>> # CONFIG_KUNIT_ALL_TESTS is not set
>> CONFIG_KUNIT_DEFAULT_ENABLED=y
>> CONFIG_NOTIFIER_ERROR_INJECTION=y
>> # CONFIG_PM_NOTIFIER_ERROR_INJECT is not set
>> CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT=y
>> # CONFIG_NETDEV_NOTIFIER_ERROR_INJECT is not set
>> CONFIG_FUNCTION_ERROR_INJECTION=y
>> # CONFIG_FAULT_INJECTION is not set
>> CONFIG_ARCH_HAS_KCOV=y
>> CONFIG_CC_HAS_SANCOV_TRACE_PC=y
>> CONFIG_KCOV=y
>> CONFIG_KCOV_ENABLE_COMPARISONS=y
>> CONFIG_KCOV_INSTRUMENT_ALL=y
>> CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
>> CONFIG_RUNTIME_TESTING_MENU=y
>> CONFIG_TEST_DHRY=y
>> # CONFIG_LKDTM is not set
>> CONFIG_CPUMASK_KUNIT_TEST=y
>> # CONFIG_TEST_LIST_SORT is not set
>> # CONFIG_TEST_MIN_HEAP is not set
>> # CONFIG_TEST_SORT is not set
>> CONFIG_TEST_DIV64=y
>> # CONFIG_TEST_IOV_ITER is not set
>> CONFIG_KPROBES_SANITY_TEST=y
>> CONFIG_FPROBE_SANITY_TEST=y
>> CONFIG_BACKTRACE_SELF_TEST=y
>> # CONFIG_TEST_REF_TRACKER is not set
>> # CONFIG_RBTREE_TEST is not set
>> CONFIG_REED_SOLOMON_TEST=y
>> CONFIG_INTERVAL_TREE_TEST=y
>> # CONFIG_ATOMIC64_SELFTEST is not set
>> # CONFIG_TEST_HEXDUMP is not set
>> # CONFIG_STRING_KUNIT_TEST is not set
>> CONFIG_STRING_HELPERS_KUNIT_TEST=y
>> # CONFIG_TEST_KSTRTOX is not set
>> CONFIG_TEST_PRINTF=y
>> CONFIG_TEST_SCANF=y
>> # CONFIG_TEST_BITMAP is not set
>> CONFIG_TEST_UUID=y
>> CONFIG_TEST_XARRAY=y
>> # CONFIG_TEST_MAPLE_TREE is not set
>> CONFIG_TEST_RHASHTABLE=y
>> # CONFIG_TEST_IDA is not set
>> CONFIG_TEST_BITOPS=y
>> CONFIG_FIND_BIT_BENCHMARK=y
>> CONFIG_TEST_FIRMWARE=y
>> CONFIG_BITFIELD_KUNIT=y
>> CONFIG_CHECKSUM_KUNIT=y
>> # CONFIG_HASH_KUNIT_TEST is not set
>> CONFIG_RESOURCE_KUNIT_TEST=y
>> CONFIG_SYSCTL_KUNIT_TEST=y
>> CONFIG_LIST_KUNIT_TEST=y
>> CONFIG_HASHTABLE_KUNIT_TEST=y
>> # CONFIG_LINEAR_RANGES_TEST is not set
>> CONFIG_CMDLINE_KUNIT_TEST=y
>> CONFIG_BITS_TEST=y
>> CONFIG_RATIONAL_KUNIT_TEST=y
>> # CONFIG_MEMCPY_KUNIT_TEST is not set
>> CONFIG_IS_SIGNED_TYPE_KUNIT_TEST=y
>> CONFIG_OVERFLOW_KUNIT_TEST=y
>> CONFIG_STACKINIT_KUNIT_TEST=y
>> CONFIG_FORTIFY_KUNIT_TEST=y
>> CONFIG_HW_BREAKPOINT_KUNIT_TEST=y
>> CONFIG_SIPHASH_KUNIT_TEST=y
>> CONFIG_TEST_UDELAY=y
>> CONFIG_TEST_MEMCAT_P=y
>> # CONFIG_TEST_MEMINIT is not set
>> CONFIG_TEST_FREE_PAGES=y
>> CONFIG_TEST_CLOCKSOURCE_WATCHDOG=y
>> CONFIG_ARCH_USE_MEMTEST=y
>> # CONFIG_MEMTEST is not set
>> # CONFIG_HYPERV_TESTING is not set
>> # end of Kernel Testing and Coverage
>>
>> #
>> # Rust hacking
>> #
>> # end of Rust hacking
>> # end of Kernel hacking
> 

