Return-Path: <linux-kbuild+bounces-5556-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC384A1D9F7
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jan 2025 16:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF4DA188644B
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jan 2025 15:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0B8148838;
	Mon, 27 Jan 2025 15:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ePQAW7bV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C4514D6ED
	for <linux-kbuild@vger.kernel.org>; Mon, 27 Jan 2025 15:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737993248; cv=none; b=nMGqidtUPpJd003BGyILm3XaLmO2HPTkxJflwQvK1xtkx6ki20dInB7jSBM22YPNebJyjyvCxgQbpEohGeJjaFBgrY2TdsiolorLdF115c5BMi3RGfV+q0lQM/kXdH43aUqIUgD6ThTcL1Y4v627Oqk6ZColQ/Oc9oSQ9+P6/B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737993248; c=relaxed/simple;
	bh=0X9sdhL71kVmvu1ebDd959FjBs/ps989bYBVyuncdgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W5q3pj5PMz1l4IE8bh1nlAX32baCHu30SXdUfUUNiJvCB3ztp5aelHw4ZTlYqqi1ritKAxv5th+qQP0OighvaGLazpd0PRTXyEq+2RBPFoCWPv+ohryYQ2k/078lhB0WQhTwcSjWYLk9cXffSlcDzjPmrh3m15Oqj3fi+oZH4Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ePQAW7bV; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d0c939ab78so11605a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Jan 2025 07:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737993245; x=1738598045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysgx+wSur/AvS3667Z5BWccdbDnndWl86nQb7G7iUWk=;
        b=ePQAW7bVlKOtGACr0XA1thJJY/ljZ7Z/J9gxQ3IAIRAypGBJ2NvHn1YmbEdUWFDYBy
         ArR4A5rYwMSRsRbB4O84wsbKVA0yPFHdZ1SRB8On5tsRCpil3eaXpBybOMexU+W+sKsB
         P1DNxLOXbVd2sxICy2dIgPH+Iiuq15WQJuJxtmjKxo/MEmOvwWCUpnijo0lSUcaaZZto
         itgeW7/1t2uWm7CJRPei36bHDqxwJpDfMklKf0FaJs9SYd/zWHiQSb3vuwSCOpf/EHQZ
         K5fUKjriHTco4LpsZ2Ye58NGSX2fac98C9ffqq4Ch+qBeQ6UU/SUzpiTP6TX+XYoWynu
         v07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737993245; x=1738598045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysgx+wSur/AvS3667Z5BWccdbDnndWl86nQb7G7iUWk=;
        b=eYCX1D/4d0UYapTVZ7qOYiCQpewefpz7JynEh+fIYyruR9SbTvCOqKys3lhsPrN+VZ
         gjj+HoXCzzIpT//5cicKqussB2t36u4N7aeY7FBBL3DOUBntKksludyfWdLHa7SHwFkj
         /d4TZjTyxwwN8IlTc/xTO3415/MCeHFE2eSluCYjwhpxl7qpIoWdsrLbdND1jubxMIFA
         mGImUEJ9zqmOJUxYgnf6DuNr9U3EdbZI2Qc3EL2IYqrHnBEr3TrrWsrU0oVOYaJBwuqn
         bszk+ovmxLRrLCeBrh6htNHZglYAyafKQErTt9q1PUxZftg+8/VWBUeM4pBzzmTROIhW
         c7DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVksBDQlKhhtOqDy4s2nv+RVe+QmwU3T1egXh99OMR/hvFcNvV28UyTO1utQuJo4V2XKt8DXSfwRXvkXE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjlaV6/5xg/Cbs0tZ+IYD6Smu1sd7zSqoUyORkLLby6pOm5/fA
	3ZGPjZSZAG1iVMN5RIZd1hhOx+f4qdJfJyrBl1ZVDJJZ8fhON356xXPRhZHIkOAgqmpmWFeK9gJ
	eBrB/l9Gcl7+ULsKlW8ej5sB0AyyniFWfHiiC
X-Gm-Gg: ASbGnctsD1El9DAmj7J6B2qUtE6v5XnTGvL7S/GyHsZesGjPi47A0tvEwSmfJBdYYRX
	2vYZr+2DcREnyQOi8p5fY2/8S7icSsh9iVw5QAaLLX+T+Oah/tFESTqcBgf4L+D0nYzYddPUCZZ
	9fYV4RrRtklaXrxYzoAg==
X-Google-Smtp-Source: AGHT+IGGrTgxnmT6MTTIUCHczAEey1Emr0QQm+/wBobmPC/ueosCGsi7o7zldGCfxX7ka0MOPCvDHPDbThojDk96/2A=
X-Received: by 2002:a50:999b:0:b0:5d9:693e:346 with SMTP id
 4fb4d7f45d1cf-5dc4e98e65emr8913a12.4.1737993244292; Mon, 27 Jan 2025 07:54:04
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202501272252.4f499056-lkp@intel.com>
In-Reply-To: <202501272252.4f499056-lkp@intel.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 27 Jan 2025 07:53:52 -0800
X-Gm-Features: AWEUYZncZiKDEjhS-PuJ-fK8i2aaiGO6JGlLsLeab6CX2lRzOwLOKD5rom48mtg
Message-ID: <CAGSQo00cSQRotx4RNX_jz=pk9yES-iv2mxVVZ4gieRq0Vsmc8w@mail.gmail.com>
Subject: Re: [linux-next:master] [modpost] e8639b7ef0: WARNING:at_include/trace/events/printk.h:#printk_sprint
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The only thing that stands out about this config relative to this
patch is that it set CONFIG_MODVERSIONS but *not*
CONFIG_EXTENDED_MODVERSIONS *or* CONFIG_BASIC_MODVERSIONS. This should
work, and mean "The kernel will attempt to read and validate any
modversions, but no modules built will have either form of modversions
encoded into them."

The first warning occurs here:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/ke=
rnel/workqueue.c#n4316

which doesn't look related to modversions at all - modversions are not
checked by a workqueue, and workqueue is not implemented by a module.

I'm not 100% familiar with the operation of the kernel test robot, but
given that this config would not be viable on the previous commit, is
it possible that what happened is:
1. A randconfig got rolled that tickles a bug earlier in the `next`
branch, but has settings that can't go backwards (e.g.
CONFIG_BASIC_MODVERSIONS off)
2. Test fails on this patch, for unrelated reasons
3. Moving the config back shows config not viable, so it's "clean"?

I'll try to look into test-booting the selected config on an earlier
commit, but with the CONFIG_BASIC_MODVERSIONS removed, but this
doesn't look related to this patch to me.

On Mon, Jan 27, 2025 at 6:43=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "WARNING:at_include/trace/events/printk.h:#prin=
tk_sprint" on:
>
> commit: e8639b7ef0f871753b4262ec0eacd3da29eebcee ("modpost: Allow extende=
d modversions without basic MODVERSIONS")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master 5ffa57f6eecefababb8cbe327222ef171943b18=
3]
>
> in testcase: trinity
> version: trinity-i386-abe9de86-1_20230429
> with following parameters:
>
>         runtime: 300s
>         group: group-03
>         nr_groups: 5
>
>
>
> config: x86_64-randconfig-071-20250125
> compiler: clang-19
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 1=
6G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> we found various random issues on this commit, but clean on parent.
>
> fc7d5e3210ae083a e8639b7ef0f871753b4262ec0ea
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :200         29%          58:200   dmesg.RIP:lock_acquire
>            :200         29%          58:200   dmesg.RIP:lock_acquired
>            :200         29%          58:200   dmesg.RIP:lock_release
>            :200         29%          58:200   dmesg.RIP:printk_sprint
>            :200         29%          58:200   dmesg.WARNING:at_include/tr=
ace/events/lock.h:#lock_acquire
>            :200         29%          58:200   dmesg.WARNING:at_include/tr=
ace/events/lock.h:#lock_acquired
>            :200         29%          58:200   dmesg.WARNING:at_include/tr=
ace/events/lock.h:#lock_release
>            :200         29%          58:200   dmesg.WARNING:at_include/tr=
ace/events/printk.h:#printk_sprint
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202501272252.4f499056-lkp@intel.=
com
>
>
> [  279.276312][ T4440] ------------[ cut here ]------------
> [  279.276316][ T4440] ------------[ cut here ]------------
> [  279.276319][ T4440] RCU not watching for tracepoint
> [ 279.276350][ T4440] WARNING: CPU: 1 PID: 4440 at include/trace/events/p=
rintk.h:33 printk_sprint (ld-temp.o:?)
> [  279.276360][ T4440] Modules linked in: intel_rapl_msr(F) intel_rapl_co=
mmon(F) crc32_pclmul(F) intel_agp(F) parport_pc(F) intel_gtt(F) parport(F) =
agpgart(F) autofs4(F)
> [  279.276374][ T4440] Unloaded tainted modules: intel_cstate(F):1
> [  279.276378][ T4440] CPU: 1 UID: 65534 PID: 4440 Comm: trinity-c3 Taint=
ed: GF       W       T  6.13.0-rc6-00039-ge8639b7ef0f8 #1
> [  279.276383][ T4440] Tainted: [F]=3DFORCED_MODULE, [W]=3DWARN, [T]=3DRA=
NDSTRUCT
> [  279.276385][ T4440] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [ 279.276386][ T4440] RIP: 0010:printk_sprint (ld-temp.o:?)
> [ 279.276390][ T4440] Code: ed 75 a0 e9 4c ff ff ff 0f 0b eb af 41 ff cf =
44 89 f8 e9 25 ff ff ff 48 c7 c7 da ce 8b 82 c6 05 2a 30 24 02 01 e8 9b c0 =
f2 ff <0f> 0b eb c4 e8 92 9e d4 ff a8 04 74 b2 eb b9 65 8b 05 21 9b f3 7e
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   ed                      in     (%dx),%eax
>    1:   75 a0                   jne    0xffffffffffffffa3
>    3:   e9 4c ff ff ff          jmp    0xffffffffffffff54
>    8:   0f 0b                   ud2
>    a:   eb af                   jmp    0xffffffffffffffbb
>    c:   41 ff cf                dec    %r15d
>    f:   44 89 f8                mov    %r15d,%eax
>   12:   e9 25 ff ff ff          jmp    0xffffffffffffff3c
>   17:   48 c7 c7 da ce 8b 82    mov    $0xffffffff828bceda,%rdi
>   1e:   c6 05 2a 30 24 02 01    movb   $0x1,0x224302a(%rip)        # 0x22=
4304f
>   25:   e8 9b c0 f2 ff          call   0xfffffffffff2c0c5
>   2a:*  0f 0b                   ud2             <-- trapping instruction
>   2c:   eb c4                   jmp    0xfffffffffffffff2
>   2e:   e8 92 9e d4 ff          call   0xffffffffffd49ec5
>   33:   a8 04                   test   $0x4,%al
>   35:   74 b2                   je     0xffffffffffffffe9
>   37:   eb b9                   jmp    0xfffffffffffffff2
>   39:   65 8b 05 21 9b f3 7e    mov    %gs:0x7ef39b21(%rip),%eax        #=
 0x7ef39b61
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   0f 0b                   ud2
>    2:   eb c4                   jmp    0xffffffffffffffc8
>    4:   e8 92 9e d4 ff          call   0xffffffffffd49e9b
>    9:   a8 04                   test   $0x4,%al
>    b:   74 b2                   je     0xffffffffffffffbf
>    d:   eb b9                   jmp    0xffffffffffffffc8
>    f:   65 8b 05 21 9b f3 7e    mov    %gs:0x7ef39b21(%rip),%eax        #=
 0x7ef39b37
> [  279.276393][ T4440] RSP: 0018:ffffc90000c0f9f8 EFLAGS: 00010086
> [  279.276395][ T4440] RAX: 0000000080000006 RBX: ffffffff84b5ce40 RCX: f=
fff88842fc00000
> [  279.276397][ T4440] RDX: ffff88842fc00000 RSI: 0000000000000027 RDI: f=
fff88842fddcb88
> [  279.276399][ T4440] RBP: 0000000000000024 R08: aaaaaaaaaaaaaaaa R09: 3=
fffffffffffffff
> [  279.276401][ T4440] R10: 00000000ffffffff R11: 00000000ffff86b8 R12: 0=
000000000000082
> [  279.276402][ T4440] R13: ffff88842fddcb81 R14: 0000000000000024 R15: 0=
000000000000028
> [  279.276404][ T4440] FS:  0000000000000000(0000) GS:ffff88842fc00000(00=
63) knlGS:00000000f7f5a280
> [  279.276407][ T4440] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [  279.276408][ T4440] CR2: 00000000f72cf000 CR3: 00000001b4b14000 CR4: 0=
0000000000406b0
> [  279.276413][ T4440] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0=
000000000000000
> [  279.276414][ T4440] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0=
000000000000400
> [  279.276416][ T4440] Call Trace:
> [  279.276418][ T4440]  <TASK>
> [ 279.276420][ T4440] ? __warn (ld-temp.o:?)
> [ 279.276424][ T4440] ? printk_sprint (ld-temp.o:?)
> [ 279.276427][ T4440] ? report_bug (ld-temp.o:?)
> [ 279.276430][ T4440] ? printk_sprint (ld-temp.o:?)
> [ 279.276434][ T4440] ? handle_bug (ld-temp.o:?)
> [ 279.276437][ T4440] ? exc_invalid_op (ld-temp.o:?)
> [ 279.276440][ T4440] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry=
.h:621)
> [ 279.276444][ T4440] ? printk_sprint (ld-temp.o:?)
> [ 279.276447][ T4440] ? printk_sprint (ld-temp.o:?)
> [ 279.276450][ T4440] vprintk_store (ld-temp.o:?)
> [ 279.276456][ T4440] vprintk_emit (ld-temp.o:?)
> [ 279.276460][ T4440] _printk (ld-temp.o:?)
> [ 279.276463][ T4440] handle_overflow (ld-temp.o:?)
> [ 279.276468][ T4440] ct_kernel_exit (ld-temp.o:?)
> [ 279.276473][ T4440] __ct_user_enter (ld-temp.o:?)
> [ 279.276476][ T4440] syscall_exit_to_user_mode (ld-temp.o:?)
> [ 279.276479][ T4440] __do_fast_syscall_32 (ld-temp.o:?)
> [ 279.276482][ T4440] ? __task_pid_nr_ns (ld-temp.o:?)
> [ 279.276487][ T4440] ? __task_pid_nr_ns (ld-temp.o:?)
> [ 279.276489][ T4440] ? __task_pid_nr_ns (ld-temp.o:?)
> [ 279.276493][ T4440] ? __task_pid_nr_ns (ld-temp.o:?)
> [ 279.276496][ T4440] ? __task_pid_nr_ns (ld-temp.o:?)
> [ 279.276499][ T4440] ? __ct_user_enter (ld-temp.o:?)
> [ 279.276502][ T4440] ? vtime_user_enter (ld-temp.o:?)
> [ 279.276505][ T4440] ? ct_kernel_exit (ld-temp.o:?)
> [ 279.276508][ T4440] ? __ct_user_enter (ld-temp.o:?)
> [ 279.276512][ T4440] ? syscall_exit_to_user_mode (ld-temp.o:?)
> [ 279.276515][ T4440] ? __do_fast_syscall_32 (ld-temp.o:?)
> [ 279.276518][ T4440] ? __do_fast_syscall_32 (ld-temp.o:?)
> [ 279.276520][ T4440] ? syscall_exit_to_user_mode (ld-temp.o:?)
> [ 279.276523][ T4440] ? __do_fast_syscall_32 (ld-temp.o:?)
> [ 279.276526][ T4440] ? syscall_exit_to_user_mode (ld-temp.o:?)
> [ 279.276529][ T4440] ? __do_fast_syscall_32 (ld-temp.o:?)
> [ 279.276531][ T4440] ? vtime_user_enter (ld-temp.o:?)
> [ 279.276533][ T4440] ? ct_kernel_exit (ld-temp.o:?)
> [ 279.276536][ T4440] do_fast_syscall_32 (ld-temp.o:?)
> [ 279.276538][ T4440] entry_SYSENTER_compat_after_hwframe (arch/x86/entry=
/entry_64_compat.S:127)
> [  279.276542][ T4440] RIP: 0023:0xf7f5f539
> [ 279.276544][ T4440] Code: 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 =
01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 =
cd 80 <5d> 5a 59 c3 cc 90 90 90 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   03 74 b4 01             add    0x1(%rsp,%rsi,4),%esi
>    4:   10 07                   adc    %al,(%rdi)
>    6:   03 74 b0 01             add    0x1(%rax,%rsi,4),%esi
>    a:   10 08                   adc    %cl,(%rax)
>    c:   03 74 d8 01             add    0x1(%rax,%rbx,8),%esi
>         ...
>   20:   00 51 52                add    %dl,0x52(%rcx)
>   23:   55                      push   %rbp
>   24:*  89 e5                   mov    %esp,%ebp                <-- trapp=
ing instruction
>   26:   0f 34                   sysenter
>   28:   cd 80                   int    $0x80
>   2a:   5d                      pop    %rbp
>   2b:   5a                      pop    %rdx
>   2c:   59                      pop    %rcx
>   2d:   c3                      ret
>   2e:   cc                      int3
>   2f:   90                      nop
>   30:   90                      nop
>   31:   90                      nop
>   32:   66 2e 0f 1f 84 00 00    cs nopw 0x0(%rax,%rax,1)
>   39:   00 00 00
>   3c:   0f                      .byte 0xf
>   3d:   1f                      (bad)
>   3e:   44                      rex.R
>         ...
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   5d                      pop    %rbp
>    1:   5a                      pop    %rdx
>    2:   59                      pop    %rcx
>    3:   c3                      ret
>    4:   cc                      int3
>    5:   90                      nop
>    6:   90                      nop
>    7:   90                      nop
>    8:   66 2e 0f 1f 84 00 00    cs nopw 0x0(%rax,%rax,1)
>    f:   00 00 00
>   12:   0f                      .byte 0xf
>   13:   1f                      (bad)
>   14:   44                      rex.R
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250127/202501272252.4f499056-lk=
p@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

