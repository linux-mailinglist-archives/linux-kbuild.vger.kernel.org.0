Return-Path: <linux-kbuild+bounces-10538-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 352CFD16343
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jan 2026 02:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B8EB3005F1F
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jan 2026 01:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F91279DC8;
	Tue, 13 Jan 2026 01:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKrhp5Ka"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5EF23957D
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Jan 2026 01:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768268847; cv=none; b=mriwL5rk7pyMB9XezuYBA3FbJ3FruNYJPD0MWodxkd0OHKT6O9ioR5qDgNr+UpQZD5WDkY/P3fPY4CPP+7Kiegt0fSiuweV733YsezUOXr36d2TY9neg07YNTsu6+Cqje07BIWiNaaS/NgPFDAqckcDcBMhY1G39JIyRlBQj5Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768268847; c=relaxed/simple;
	bh=EThfGl84CTszs/M0mz38/Onq65rS/FlgjvnqzHnCYTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=px3GvAA24G56eSwU8XjQV5IpFqKagzsimX63P9oVoekS7FiLYfrkwu+qJenbl4YZV7UA+PH6B1fCUuxXU1TkIi0bOJ6IN56DrWFr80RGzHbHHuakvqIPug0w43jcpi+FTTlyHq97DaTTvMR5v9PgCWcTvID1ldI6C6EgWirEXTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKrhp5Ka; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-430fbb6012bso5670225f8f.1
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jan 2026 17:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768268845; x=1768873645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5Zya1QiiH1g15sa03C60PMdmscKG1ONGxgStc03n5E=;
        b=fKrhp5KatqecBzcSxMe72R/Yw5Yd4ks2Bhjjwc2KezKmrm6nXgpqrFQb0zPGRaCcg2
         qcSObaa9pOjhbqBX9TtoPDx7aosNGM4UgSRCHXIkEpRJk6sN69xBosOCPGGQfxMoL04x
         mDDKGaCdlIFSzaEDCWkJYqeosq+oEuujDW4vMxoJZBT66wwHTU+7xfaLEFS62iML0vgg
         7qvqZI+fQchrj6BfmQA9E5RqNRW5SppjWn5fMXIgn6CxuaC/Rn6JpbbIzhwKBfTeWx7X
         OTmJGtj/H/dXOEh6+jd7a2p3CB+QxBnreDWntODIBNuDJcTByDRur23+6/k3X3xJpaf7
         E9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768268845; x=1768873645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r5Zya1QiiH1g15sa03C60PMdmscKG1ONGxgStc03n5E=;
        b=kh5sk4cg1joCuqnu7VwIL5/LxUDTOSXPHBy/j+IYkjqAf8P6S3PWYp8sw6vXcMDybV
         cp2VTvkN+z4vtEyciBsn6OA239HYPPTlOF8Vy13Ll29iWoh/iZt5mJkJuMd2l0dEZDff
         LgPvS8tv18EEfSkHLAoW7KoVXuvvFMgOYQvuTp1XmMWPczPTAUEg55MtyFobnx9KgxuC
         YX2IXH0qOBJL5nY+9uKVOZjfI8oDIVuFik4osYZACAem2RaI7DJN6plA0eUwokOHCaqM
         BaEsO13mlvkbXx2+a33YyC+lfsB4dLmzVFivlBfe8gO5/eposVe4nk6GigQMnUxnPcPH
         ebOw==
X-Forwarded-Encrypted: i=1; AJvYcCVSHTlyf67la456BPTtSalFmtwlYxDhP2WdyRdtcElS6CXtX9yIJlRHltk9RL1WpmV604FByzev3auPmCI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1xp9j3M2IYSCuzYuadid13oygbKhCi9Qbs3qkyqSunBPq/MQ8
	vzdB5zpH53tW7jAPMEboXGD7ROVS/8mz8KN7IQUUoOj3OshhcOGYPdJKzrCwE2VIxPoKL2WxoF9
	QsyI4WfOOtaK/e7lz4oV/6AC9sPexBok=
X-Gm-Gg: AY/fxX7beCNjiZQcUEixU+QuioQMPs8hwpDSnkf8xT1tmAEaOsxITzxl9K9CLPRpQcJ
	VvYM1b5PdC5C48dOSNUEOS8srmqwYdFoDjbbinzW/5pEPc6Fh/f9pyDj9XCosFyKASGm4uXVbzv
	15MA50jsWnCPt7gSPwcmqlhNRw6FJjKbgPnfvisYr1PbW28Dxu9N7J1bsSxg0aT74IelMAkb1oo
	+neD//3ERAXnac9j5hy8azgFlph6GwmIDIujvfWokQujQgUsA+zgZ8ZEMnzNaDO0tNYrLROI+r0
	hUtY/NCpOn9qU/FgJoD2cveRgAL+lg==
X-Google-Smtp-Source: AGHT+IGLZPsHQZdYP+igQHFiHZwML+c/tx73CNXLiZEv1na3EZeREwCRzVBn7g5quI4ihevQAYTcxL8ulaKSY+q8K1Y=
X-Received: by 2002:a05:6000:1a89:b0:431:342:ad4e with SMTP id
 ffacd0b85a97d-432c37a9b5emr27240018f8f.62.1768268844511; Mon, 12 Jan 2026
 17:47:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1768233085.git.m.wieczorretman@pm.me> <20260112102957.359c8de904b11dc23cffd575@linux-foundation.org>
 <aWU-oL8oYS_PTwzc@maciej> <20260112125348.124d201ef2baf762561a43af@linux-foundation.org>
In-Reply-To: <20260112125348.124d201ef2baf762561a43af@linux-foundation.org>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 13 Jan 2026 02:47:13 +0100
X-Gm-Features: AZwV_QjCQ1fbtNH6MxAuTA9Y-OoKsLsk_NAIZlsBpLK13R0P_Z1v4NHXaV8E6rI
Message-ID: <CA+fCnZci8YK04PPMT7gkMrrNHbMB3Ks+D4xG-5XkEOaywyrGhw@mail.gmail.com>
Subject: Re: [PATCH v8 00/14] kasan: x86: arm64: KASAN tag-based mode for x86
To: Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?Q?Maciej_Wiecz=C3=B3r=2DRetman?= <m.wieczorretman@pm.me>
Cc: corbet@lwn.net, morbo@google.com, rppt@kernel.org, 
	lorenzo.stoakes@oracle.com, ubizjak@gmail.com, mingo@redhat.com, 
	vincenzo.frascino@arm.com, maciej.wieczor-retman@intel.com, maz@kernel.org, 
	catalin.marinas@arm.com, yeoreum.yun@arm.com, will@kernel.org, 
	jackmanb@google.com, samuel.holland@sifive.com, glider@google.com, 
	osandov@fb.com, nsc@kernel.org, luto@kernel.org, jpoimboe@kernel.org, 
	Liam.Howlett@oracle.com, kees@kernel.org, jan.kiszka@siemens.com, 
	thomas.lendacky@amd.com, jeremy.linton@arm.com, dvyukov@google.com, 
	axelrasmussen@google.com, leitao@debian.org, ryabinin.a.a@gmail.com, 
	bigeasy@linutronix.de, peterz@infradead.org, mark.rutland@arm.com, 
	urezki@gmail.com, brgerst@gmail.com, hpa@zytor.com, mhocko@suse.com, 
	weixugc@google.com, kbingham@kernel.org, vbabka@suse.cz, nathan@kernel.org, 
	trintaeoitogc@gmail.com, samitolvanen@google.com, tglx@kernel.org, 
	thuth@redhat.com, surenb@google.com, anshuman.khandual@arm.com, 
	smostafa@google.com, yuanchu@google.com, ada.coupriediaz@arm.com, 
	dave.hansen@linux.intel.com, kas@kernel.org, nick.desaulniers+lkml@gmail.com, 
	david@kernel.org, bp@alien8.de, ardb@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 9:53=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 12 Jan 2026 20:08:23 +0000 Maciej Wiecz=C3=B3r-Retman <m.wieczorr=
etman@pm.me> wrote:
>
> > >OK, known issues and they are understandable.  With this patchset is
> > >there any way in which our testers can encounter these things?  If so
> > >can we make changes to protect them from hitting known issues?
> >
> > The gcc documentation states that the -fsanitize=3Dkernel-hwaddress is
> > similar to -fsanitize=3Dhwaddress, which only works on AArch64. So that
> > hints that it shouldn't work.
> >
> > But while with KASAN sw_tags enabled the kernel compiles fine with gcc,
> > at least in my patched qemu it doesn't run. I remember Ada Couprie Diaz
> > mention that passing -march=3Darrowlake might help since the tag suppor=
t
> > seems to be based on arch.

FYI, there are some known GCC issues with arm64 SW_TAGS mode as well:
https://bugzilla.kernel.org/show_bug.cgi?id=3D218043#c3.

> >
> > I'll check if there's a non-hacky way to have gcc work too, but perhaps
> > to minimize hitting known issue, for now HAVE_ARCH_KASAN_SW_TAGS should
> > be locked behind both ADDRESS_MASKING and CC_IS_CLANG in the Kconfig?
>
> Yes please - my main concern is that we avoid causing any disruption to
> testers/buildbots/fuzzers/etc.

I left some comments, but from my/KASAN point of view, the series is
ready for linux-next (but this could wait for a week and maybe the
next version of the series).

I wouldn't think there would be disruption issues: one would need to
deliberately enable the SW_TAGS mode for x86 (as GENERIC is the
default mode when just enabling KASAN). But I don't mind locking down
x86 SW_TAGS to be Clang-only for now if GCC is known not to work at
all.

