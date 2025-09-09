Return-Path: <linux-kbuild+bounces-8785-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E239B4FFDB
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 16:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 432DB1C60DF6
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 14:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C955E24167A;
	Tue,  9 Sep 2025 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0xlMchK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8B91A9F8E;
	Tue,  9 Sep 2025 14:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429159; cv=none; b=IxQXugOedZD2ScnHIRuCOuvWjMTIt3/oV46vX53oF8iHouoQmihpBMqlCzcABFaywccbr1ZIHc2icKo5f3QL+qO/PWyfWEpuLhi2RNezCwpA+voAVTK5i4oQcxK0x0aXM3kxQlXLtfM2ync5CbPpPuq5UeylmzzE+0FU4lkepeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429159; c=relaxed/simple;
	bh=h9g92wWrXJhuOCmJ8Py7lEU0MPRoS9lrUiVWjii3lxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gd019p1wkvxl1Er8SAMlJhklkQn3gbU06rI4/7WNy/54Iizuiwd5aqRrKfYi+rzsT13SUmN3c7ybbWwAhXRDNrMFyrYe17VeXqrIs4dBELbyBhX/ykZtuE4C4JPhcEe7o6X/X3syn3W4wSX/lO0dMxybBUMQsRG6zQktP2lRhDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0xlMchK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3e2055ce973so3110606f8f.0;
        Tue, 09 Sep 2025 07:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757429156; x=1758033956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8T/yu3N8TV6o0nCvXPls2b7J7vwcGfC7bXk5KdT0X2s=;
        b=K0xlMchKtS1zSeEAB7zblOybthOsZREgUi19xv8mUzjS9kEZ4m89sSUc1xqI0m+Iqf
         lU+i8Lf5Rpd+BddPoMoSaWPAGrOn3MOBD2BEmf/Q+Jp4QILxzFW/p/tOPj2HmOoBibQ2
         1taY+CJRvQ1RmbrQUB0TIez8/FBA3EvtJk6mSpJZFZSFgKY5xMrOTloyRRvOerjsS7e9
         kp3h0bU1ThoZnnDIZ2smb/FkS1Vm4Ne3dr6wnV1SrZqM/mCUN2L1NNZxDm+tmkY91BK2
         4tD5Of5ClmT+IDXaiXgqf2GrVvb83K2GupBI8rJCoOrLt3znl71D4MKGGZt7BWe9W6BS
         t6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429156; x=1758033956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T/yu3N8TV6o0nCvXPls2b7J7vwcGfC7bXk5KdT0X2s=;
        b=BGxug+9re15bLf+/xiP387qbj1uBTaMZ2K5UoLkrX2LTE4+atjcgkj8JxzhCQTCNNL
         klknKB+HaHXZw0yxz9K4/aCUKPDQnZR+0ttu2YDemFrQUEVTNQKPoMK+/DOB53aygQOB
         eSaUSjwsxpvg88rDsCnpNMF0wdQa2aaRDTF63P1qRLmyA/uwIKTB1coiyASb73E56t+N
         fBkJnOB1trpZ/f+1x8HBqvc09LbPMJ7sxSbjsV96jjNVQXJpjnCyCri3Ufz7++bTl2Pe
         G+mac39TieBRFxcNUZnwkCrZKoqPGb/GSXputsZX+oEaFjTwppxWRqTyP9NBS5ZQog+p
         7pwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFEwpYla8Te2rybinTTmn8m2bWHF/Yb9vAoo3BvODJ09LDtSJIO5u/tVnFYH3DkpHLgWETclBPvMIeHw25@vger.kernel.org, AJvYcCWbBck9kWyu7RB7k7TK2JW+I6uVhk7v812OMykzZSNcB9zoJNchF32cavP6XpQd3UhssX1fYg8OjTY=@vger.kernel.org, AJvYcCXX1Pszt5ltiFdgSrF5eZL+SSSFVGufCC/CJoSjqSoGAWMvvacoJTKHWoHb3UBvbGXwo+WnkYMaA6otNvA6@vger.kernel.org
X-Gm-Message-State: AOJu0YwU2+LuhbSKAxwqyYnRL18Tbg/npwywcLsZslDf0JA82C7FzrxP
	QfSM9VPUcWy6ouOfEIxRXsmrcXVFpRp9iANlzoCndFRSpJcoe1sZhXuNNCFFCwA5k7srxinwbeA
	hA40xmszVRzXv7MzbrhMbT8UfFIQlyjY=
X-Gm-Gg: ASbGncvSblsbBVlXXXgBkdoYCHV8uRYrHs23ULYYGgJ+9raV2ROWb00Xh2yaw5+R7w6
	+0i/Gc4FCirAaEfTkZiU9ifmK1DOb4ZjkhYKo6Q/LreWMbI3nCWLnlUbdeYHZ9pavvrgtptJGTU
	GmoeiM5v3kkE4zuren6CA9x9nOpWUGS/RfE5kV0S81CLm05yVJs7b0nUbdTzHId7sUmD5IwSDML
	MBE1q6F
X-Google-Smtp-Source: AGHT+IH8mznDXMiTQJweNCJMFeyunuSNo6fJv5XkfHlGkiJSKVNMuvO31tCVhwde5ClSRv4GzI1pVbP/cjzPjFzqa4s=
X-Received: by 2002:a05:6000:2c0d:b0:3e7:441e:c9e1 with SMTP id
 ffacd0b85a97d-3e7441ecde8mr6759404f8f.18.1757429155814; Tue, 09 Sep 2025
 07:45:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <2f8115faaca5f79062542f930320cbfc6981863d.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZf1YeWzf38XjkXPjTH3dqSCeZ2_XaK0AGUeG05UuXPAbw@mail.gmail.com>
 <cfz7zprwfird7gf5fl36zdpmv3lmht2ibcfwkeulqocw3kokpl@u6snlpuqcc5k>
 <CA+fCnZe52tKCuGUP0LzbAsxqiukOXyLFT4Zc6_c0K1mFCXJ=dQ@mail.gmail.com> <m7sliogcv2ggy2m7inkzy5p6fkpinic7hqtjoo22ewycancs64@dnfcl2khgfur>
In-Reply-To: <m7sliogcv2ggy2m7inkzy5p6fkpinic7hqtjoo22ewycancs64@dnfcl2khgfur>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 9 Sep 2025 16:45:43 +0200
X-Gm-Features: AS18NWCko3Nu4vYg1YjsVoZlO3pFTQTWFNFMYZcWhGCR7k_x37D691H981KEWl4
Message-ID: <CA+fCnZc3ZY43KeQcWSw4kgcCqJpAvNj6gKd+x0AkjhuE2R8Hdw@mail.gmail.com>
Subject: Re: [PATCH v5 15/19] kasan: x86: Apply multishot to the inline report handler
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com, 
	kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com, 
	alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com, 
	trintaeoitogc@gmail.com, axelrasmussen@google.com, yuanchu@google.com, 
	joey.gouly@arm.com, samitolvanen@google.com, joel.granados@kernel.org, 
	graf@amazon.com, vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org, 
	thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com, 
	kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com, 
	nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com, 
	justinstitt@google.com, catalin.marinas@arm.com, 
	alexander.shishkin@linux.intel.com, samuel.holland@sifive.com, 
	dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com, 
	dvyukov@google.com, tglx@linutronix.de, scott@os.amperecomputing.com, 
	jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org, 
	lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com, 
	kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org, 
	jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com, 
	ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org, 
	peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com, 
	ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com, 
	ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org, 
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com, rppt@kernel.org, 
	pcc@google.com, jan.kiszka@siemens.com, nicolas.schier@linux.dev, 
	will@kernel.org, jhubbard@nvidia.com, bp@alien8.de, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 10:42=E2=80=AFAM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> On 2025-09-08 at 22:19:11 +0200, Andrey Konovalov wrote:
> >On Mon, Sep 8, 2025 at 3:04=E2=80=AFPM Maciej Wieczor-Retman
> ><maciej.wieczor-retman@intel.com> wrote:
> >>
> >> >> +       if (kasan_multi_shot_enabled())
> >> >> +               return true;
> >> >
> >> >It's odd this this is required on x86 but not on arm64, see my commen=
t
> >> >on the patch that adds kasan_inline_handler().
> >> >
> >>
> >> I think this is needed if we want to keep the kasan_inline_recover bel=
ow.
> >> Because without this patch, kasan_report() will report a mismatch, an =
then die()
> >> will be called. So the multishot gets ignored.
> >
> >But die() should be called only when recovery is disabled. And
> >recovery should always be enabled.
>
> Hmm I thought when I was testing inline mode last time, that recovery was=
 always
> disabled. I'll recheck later.
>
> But just looking at llvm code, hwasan-recover has init(false). And the ke=
rnel
> doesn't do anything to this value in Makefile.kasan. Perhaps it just need=
s to be
> corrected in the Makefile.kasan?

Recovery should be disabled as the default when
-fsanitize=3Dkernel-hwaddress is used (unless something was
broken/changed); see this patch:

https://github.com/llvm/llvm-project/commit/1ba9d9c6ca1ffeef7e833261ebca463=
a92adf82f

