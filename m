Return-Path: <linux-kbuild+bounces-10176-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 174C1CCDD7A
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 23:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A81D330680E3
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 22:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B6E302753;
	Thu, 18 Dec 2025 22:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8x8FlI3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D131264628
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Dec 2025 22:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766097414; cv=none; b=rIAv+yUqOwn4gEdWuJi3QA5MxRuvgXSz3UQIPKHdKE6yTQ0q503zF7ApIx4EQSmI9cc83I9s5pIzpJXdQqa5+ARh7ebAfDc95bZf/pnvVG2MmDXYTx9io8eqOKo/baCj579i912XkUskiFOaU+rPZzsgLink/RZ8txcCXW/O4H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766097414; c=relaxed/simple;
	bh=R8UeLBJLrvkfvZOEZSqcabfSgjfJkFuoPrm60lLwYBY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LQfOGbO54+eVCEoyQ6T8TR7DLrjKicNWx1ZhxiYEN/i5tal++ZthqPeVn6nJiyf4rwdsktqp5oA0q/wYL0f8DNrwy6w8rrDFEbMVAjdSgXQgHvSPn+sxzbWljQid2z0Xm/4QtxFAzQhWyGrShjctWBAZoWDnQXFHtVINOCsPqAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8x8FlI3; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso1063659a12.3
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Dec 2025 14:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766097411; x=1766702211; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VzVQ1y8+WKGH6EPGxTsxz1kEYrhRBeEdLO+POK8ea7k=;
        b=G8x8FlI3sn0OwbT2cHGOW/DjZph5q9pdSQB4zJCFA5ueteqkvP839NC7ZCDc3CeNnV
         X9Kb3Wxy94z6CSXUZvnDAq1ulbdVsrun/CKLieRZJEV03/5T67xXlSixd3Bg17k8Sccy
         aPUvqsvGHbDZ2wUfGSNwqFwbG5T/6wBal82HwfOvGUeTTSjPmfZJi91GCTW1bphq2RIt
         p1OARAJ73MpcBUQdFnx2EIR6YRjNejRYaQ45jpIKv7mENlWUgBcnhRI8vdQaxcRwJf3j
         MfzcwaIWa+SgaU+XdpomdQWjJlOTyKJan8S7pGBlWDeHMfi4T+1AEwGesQegdlahHvyQ
         rVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766097411; x=1766702211;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VzVQ1y8+WKGH6EPGxTsxz1kEYrhRBeEdLO+POK8ea7k=;
        b=a0AMi5GPn55HcpwI2xhIcFWeE5hmFq0Kr6LcNewaV92pYZ70fvgYLjyBkPyWzco/GC
         YfUp+pKVxhG+9dXgbyIsRZ/Q3gq9xu6RKyMarHgB6nPz3ExKp2sMCyoay7FrXIQKP+HE
         yHm+5cyGf75y2TZoQNjFO3XWW2CaBLqunDXMOznZiWh9x0f1SVa7K3XKrAoEnpXHFsjD
         75ZmHJa2NDMzTA9TMeo2H6PTbnMCOSRqQ4IQXErY8OR+ilYzqr2xuvXpNikwt+hSrYsi
         RtCOgx6tGMgYqtpRdcDr2r4P1tOd6vlkcmbwaITNpyULiO1g+Fn3mLVtv5OzAWQ1BVHR
         CiLw==
X-Forwarded-Encrypted: i=1; AJvYcCXlclqwRI8H5XvKKMficSH2t0ggN+0KFPvNj6RwIIesz5U8e9hG+/Fz0QDHOw9yekMiVfNJHPobo6FRDfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBfW0idnQND0xJFftOztXIHOBL2aPx21vJOz3wTzi10cITjznI
	LAUhhH+FOgYTs0/YlaNR1SKs2jDlUps7tSMY2A+F+q5f6Ltx9MZu+7up
X-Gm-Gg: AY/fxX40j+Bs2C/HUD3QozVmbX8ve4BG+tT4DYsncj4OkssAJMS1MkNum+mFKMuN7vi
	jReyYlfqeP47K77kK7Nosh0TmI7gEWt49WrQaOF6oWX4OH7sH34fyqaGdzcls1464NHkhWC6RS2
	H9AlC3ANiRBUPOZWqt8GL0lzF1lCHMgb2hh4ZITkms5RHDbIKUZu3fV4hPDt3cK/cLP0TQYfu4J
	scsjXqFFx/nuQGBvlqLHDFNRz0XTAh/fEJowEZvZ4qdBQBM/wiWwPOaSs+iM9pRMMcXK/KRJlu2
	xE8K8i8cv5qI/jd4fKb0jZU0Q002sos10c8MhL0W4zuKvV0AJ0Rv7yr0bVr2ig6oOP6Muf0RF0B
	f0JXNbQ8j00TH21vuNNHMscCv4Br3dvGuN+R09EtTcOfW/X+luS2QzMyiVVXk9NHq4ttdSNERgW
	6tO9EpRqgMvpFsa8Ui+dJd8/2/zLs+NgsVUiPaOkl0ET7A6JI=
X-Google-Smtp-Source: AGHT+IHNPlWMg4U+f1upK+9jgW3JjSmNEr/AngVm9bM2DPXIk+aTU/1sGxVvbhy1P/adlu2zEQdkZQ==
X-Received: by 2002:a05:7300:80c2:b0:2ae:4be1:db4a with SMTP id 5a478bee46e88-2b05ec02ff2mr1170186eec.12.1766097410643;
        Thu, 18 Dec 2025 14:36:50 -0800 (PST)
Received: from ?IPv6:2a03:83e0:115c:1:4779:aa2b:e8ff:52c4? ([2620:10d:c090:500::5:3eff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffd5f86sm1263617eec.5.2025.12.18.14.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 14:36:50 -0800 (PST)
Message-ID: <78acd4cd0cb8ed6b4c0c36cb79294efe606a4366.camel@gmail.com>
Subject: Re: [PATCH bpf-next v4 5/8] kbuild: Sync kconfig when
 PAHOLE_VERSION changes
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alan Maguire	
 <alan.maguire@oracle.com>, Alexei Starovoitov <ast@kernel.org>, Andrea
 Righi	 <arighi@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Andrii Nakryiko	 <andrii@kernel.org>, Bill Wendling <morbo@google.com>,
 Changwoo Min	 <changwoo@igalia.com>, Daniel Borkmann
 <daniel@iogearbox.net>, David Vernet	 <void@manifault.com>, Donglin Peng
 <dolinux.peng@gmail.com>, Hao Luo	 <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, John Fastabend	 <john.fastabend@gmail.com>, Jonathan
 Corbet <corbet@lwn.net>, Justin Stitt	 <justinstitt@google.com>, KP Singh
 <kpsingh@kernel.org>, Martin KaFai Lau	 <martin.lau@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers	
 <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nsc@kernel.org>, Shuah
 Khan	 <shuah@kernel.org>, Song Liu <song@kernel.org>, Stanislav Fomichev	
 <sdf@fomichev.me>, Tejun Heo <tj@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>
Cc: bpf@vger.kernel.org, dwarves@vger.kernel.org,
 linux-kbuild@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 sched-ext@lists.linux.dev
Date: Thu, 18 Dec 2025 14:36:47 -0800
In-Reply-To: <9640d2f5-7e6e-4526-a9ab-831bd826f01d@linux.dev>
References: <20251218003314.260269-1-ihor.solodrai@linux.dev>
	 <20251218003314.260269-6-ihor.solodrai@linux.dev>
	 <8be2cafa00b759220e73a6ce837ac9a3ff52da1f.camel@gmail.com>
	 <9640d2f5-7e6e-4526-a9ab-831bd826f01d@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-12-18 at 13:33 -0800, Ihor Solodrai wrote:
> On 12/18/25 11:21 AM, Eduard Zingerman wrote:
> > On Wed, 2025-12-17 at 16:33 -0800, Ihor Solodrai wrote:
> > > This patch implements kconfig re-sync when the pahole version changes
> > > between builds, similar to how it happens for compiler version change
> > > via CC_VERSION_TEXT.
> > >=20
> > > Define PAHOLE_VERSION in the top-level Makefile and export it for
> > > config builds. Set CONFIG_PAHOLE_VERSION default to the exported
> > > variable.
> > >=20
> > > Kconfig records the PAHOLE_VERSION value in
> > > include/config/auto.conf.cmd [1].
> > >=20
> > > The Makefile includes auto.conf.cmd, so if PAHOLE_VERSION changes
> > > between builds, make detects a dependency change and triggers
> > > syncconfig to update the kconfig [2].
> > >=20
> > > For external module builds, add a warning message in the prepare
> > > target, similar to the existing compiler version mismatch warning.
> > >=20
> > > Note that if pahole is not installed or available, PAHOLE_VERSION is
> > > set to 0 by pahole-version.sh, so the (un)installation of pahole is
> > > treated as a version change.
> > >=20
> > > See previous discussions for context [3].
> > >=20
> > > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/scripts/kconfig/preprocess.c?h=3Dv6.18#n91
> > > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/Makefile?h=3Dv6.18#n815
> > > [3] https://lore.kernel.org/bpf/8f946abf-dd88-4fac-8bb4-84fcd8d81cf0@=
oracle.com/
> > >=20
> > > Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> > > ---
> >=20
> > When building BPF selftest modules the pahole version change was
> > detected, but it seems that BTF rebuild was not triggered:
> >=20
> >   $ (cd ./tools/testing/selftests/bpf/test_kmods/; make -j)
> >   make[1]: Entering directory '/home/ezingerman/bpf-next'
> >   make[2]: Entering directory '/home/ezingerman/bpf-next/tools/testing/=
selftests/bpf/test_kmods'
> >     CC [M]  bpf_testmod.o
> >     CC [M]  bpf_test_no_cfi.o
> >     CC [M]  bpf_test_modorder_x.o
> >     CC [M]  bpf_test_modorder_y.o
> >     CC [M]  bpf_test_rqspinlock.o
> >     MODPOST Module.symvers
> >     CC [M]  bpf_testmod.mod.o
> >     CC [M]  .module-common.o
> >     CC [M]  bpf_test_no_cfi.mod.o
> >     CC [M]  bpf_test_modorder_x.mod.o
> >     CC [M]  bpf_test_modorder_y.mod.o
> >     CC [M]  bpf_test_rqspinlock.mod.o
> >     LD [M]  bpf_test_modorder_x.ko
> >     LD [M]  bpf_testmod.ko
> >     LD [M]  bpf_test_modorder_y.ko
> >     LD [M]  bpf_test_no_cfi.ko
> >     BTF [M] bpf_test_modorder_x.ko
> >     LD [M]  bpf_test_rqspinlock.ko
> >     BTF     bpf_test_modorder_x.ko
> >     BTF [M] bpf_test_no_cfi.ko
> >     BTF [M] bpf_test_modorder_y.ko
> >     BTF [M] bpf_testmod.ko
> >     BTF     bpf_test_no_cfi.ko
> >     BTF     bpf_test_modorder_y.ko
> >     BTF [M] bpf_test_rqspinlock.ko
> >     BTF     bpf_testmod.ko
> >     BTF     bpf_test_rqspinlock.ko
> >     BTFIDS  bpf_test_modorder_x.ko
> >     BTFIDS  bpf_test_modorder_y.ko
> >     BTFIDS  bpf_test_no_cfi.ko
> >     BTFIDS  bpf_testmod.ko
> >     OBJCOPY bpf_test_modorder_x.ko.BTF
> >     BTFIDS  bpf_test_rqspinlock.ko
> >     OBJCOPY bpf_test_no_cfi.ko.BTF
> >     OBJCOPY bpf_test_modorder_y.ko.BTF
> >     OBJCOPY bpf_testmod.ko.BTF
> >     OBJCOPY bpf_test_rqspinlock.ko.BTF
> >   make[2]: Leaving directory '/home/ezingerman/bpf-next/tools/testing/s=
elftests/bpf/test_kmods'
> >   make[1]: Leaving directory '/home/ezingerman/bpf-next'
> >   [~/bpf-next]
> >   $ (cd ./tools/testing/selftests/bpf/test_kmods/; make -j)
> >   make[1]: Entering directory '/home/ezingerman/bpf-next'
> >   make[2]: Entering directory '/home/ezingerman/bpf-next/tools/testing/=
selftests/bpf/test_kmods'
> >   make[2]: Leaving directory '/home/ezingerman/bpf-next/tools/testing/s=
elftests/bpf/test_kmods'
> >   make[1]: Leaving directory '/home/ezingerman/bpf-next'
> >=20
> > ... update pahole from version 131 to 132 ...
> >=20
> >   [~/bpf-next]
> >   $ (cd ./tools/testing/selftests/bpf/test_kmods/; make -j)
> >   make[1]: Entering directory '/home/ezingerman/bpf-next'
> >   make[2]: Entering directory '/home/ezingerman/bpf-next/tools/testing/=
selftests/bpf/test_kmods'
> >   warning: pahole version differs from the one used to build the kernel
> >     The kernel was built with: 131
> >     You are using:             132
> >   make[2]: Leaving directory '/home/ezingerman/bpf-next/tools/testing/s=
elftests/bpf/test_kmods'
> >   make[1]: Leaving directory '/home/ezingerman/bpf-next'
> >=20
> > Is this an expected behavior?
>=20
> Yes, it's expected.
>=20
> I simply repeated the logic used for compiler version change: for
> external modules only the warning is printed.
>=20
> See https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/Makefile?h=3Dv6.18#n1857
>=20

Ok, it does rebuild BTF for the kernel itself.

Tested-by: Eduard Zingerman <eddyz87@gmail.com>

