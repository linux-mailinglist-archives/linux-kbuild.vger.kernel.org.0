Return-Path: <linux-kbuild+bounces-8787-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 715DCB4FFE6
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 16:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13DBD1C274CF
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 14:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC74534F490;
	Tue,  9 Sep 2025 14:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXSCxk0O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F18205ABA;
	Tue,  9 Sep 2025 14:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429191; cv=none; b=EkF8+B9ytpF1JqvYjhDjYrTeqh6tFdpbxgiyWkLZOmCA3g0BeBdWEn7IxIOfGtniyOHHQ2lOPsN95oqzUs0p+GznRJtjnG4XGSYgumYx3KeX7zAgY+euY/dtUpXAcePokc8Lrhhj3c64kkzawgWSAAbfZ0zs0rhzTwNPQFeyypY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429191; c=relaxed/simple;
	bh=9r8is19th/mpc8+gBUPuFGFOMpuM+eINAVaHU5/+AZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Up1s+aGd5ceujjobAYoQtNwnf2EPGxOIZAbqZ0JPtT2R1p9Xu6gRKlOaXmGWsvv6e1F6RfMbpvC6sw9sFulO+1zlAvVGZmu2M/J9+Jy/v8dlGuWGjj1uz1OjXwrVRyPp2QTraJ/H+FRN2WS6kvjP81u4/4eZnez9moqJaOgOuTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXSCxk0O; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so38304145e9.0;
        Tue, 09 Sep 2025 07:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757429188; x=1758033988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9r8is19th/mpc8+gBUPuFGFOMpuM+eINAVaHU5/+AZQ=;
        b=FXSCxk0OphkLXH5Y60GjqIB40uXL8ZhgtgbxAyodaZ56PCbLJc2dolMyrkB4j4dPRx
         4KKw6Z86tL/8jy5QWQ0BzB5brKbMTyhL1zrU4pFfCGQawMsgQoiBslCH7ymZdyD10x1P
         WCtvBHuVP9wlWPfWfW0FeAeYewtvL6ctGaX/hP4H9qm85IIPv0qyptOI1brdKq9nPY9S
         4nQCx7c8H1/rzlEEpUCr8mUVBGIBH1sauBK4Cwgt8gEvRa8f1lUoy+oD3RAb08q+pW81
         1ksueaRzeF0PmMR69/HMcKWHfyH9yV9uUZEoTdhxrl1nszA5BkLCzDS4jiK+yrCuaRO7
         +92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429188; x=1758033988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9r8is19th/mpc8+gBUPuFGFOMpuM+eINAVaHU5/+AZQ=;
        b=Rhoh07uQ4PO+XTdclyKyI4pDqEFPOaQO6wpe6Y82M7RBRhXud/x1kLfy/jZjcQvgUp
         59Qm5xYHh8Q+iGryUGfttIK69zhQYdiulMkEGJkRNTnAc5eAiKz9XoEsyHxU3DtH53cR
         2ivmFFcuhdc7NW2zrZa/Bd4wwmOm/YAXvjMBD4akHQix8x/fdkhMxTF2VkbcLwoZg0Tl
         tVJenDicKm8SrxyTmysn4jQB6I9J7nTzos04g58FxTFmCZbFonRO3BCtQnGwzxyAwvHD
         ZHkwjnv6lzIBL3gCvOCc/+gKWFlKivN9aTIOJJFbIyDT8coxiOcV71rLj2hGftmHe3ET
         Ul4A==
X-Forwarded-Encrypted: i=1; AJvYcCV0cBK8TReEMi0xpsduFFBEeO4PiTGyU8OrFLcwTGDjjppEy+b7e43EiI+6+v4oe3hlqSG1B7c969zgFNiy@vger.kernel.org, AJvYcCWLNzi2q4MwCvktK9IQgCZCgJBOexMVvn0smyDIiDBDuPzHTGvKYSb6AbscVcqUeOnIkBseJFAcrFJq0f4r@vger.kernel.org, AJvYcCWhjcB7VONve6tzP57gPH0fDgznER1dywoLOuyb8JZBp95N6SPhM6DMWOG6uBgebbbDg2CmF+oRfK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN9oOtb5GPgNas8g6kJTA0SnpukRo9UU1iVW2vdhNtzcJz1PzZ
	IhnBt+1RVg5qTnnjAOJzHpb1Y9IcyfXbOgDLxcdmciZfBgVLgUUalU6X/jS45Ho3B/1QgLkYPJ/
	sKeIygetbDbOOfyZN/YoeL8BbzKenLZA=
X-Gm-Gg: ASbGncsnYP6aeBgebSVOQx7QZ3Z3PqkJ7ww9PCot/9hbOx/kY/UF77Z7bNNBE3XUS5j
	AzHXGE/rwKtXXk9aXjYsbCP2bF7A1g7yS150/V9fDM7YhMc+7HQ/HJxrpBFTJjg2xI6ybSTTT7m
	HjwaRReoOzh5eKSVFPNfpSeq/GHqUXr/kF+fJch1Th0FzBJsVTURIqGUr+yyLATPz6QZ15He2h0
	7gZdqolw7KWfBvo89w=
X-Google-Smtp-Source: AGHT+IHX8hpEThdKWhfgKRLr6W0FWhcfhr7A4C3lXlb+Th2laAYeLYdN8LPk5jePjYDY52XyG4mlIX7jog2+tQhQdNM=
X-Received: by 2002:a05:600c:3b1d:b0:45b:8ac2:9761 with SMTP id
 5b1f17b1804b1-45dde20e5c0mr116112155e9.13.1757429188072; Tue, 09 Sep 2025
 07:46:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <36c0e5e9d875addc42a73168b8090144c327ec9f.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZcMV0BOJyvx2nciCK2jvht-Hx0HnFtRzcc=zu+pQSOdVw@mail.gmail.com>
 <couuy2aawztipvnlmaloadkbceewcekur5qbtzktr7ovneduvf@l47rxycy65aa>
 <hw7xa2ooqeyjo5ypc5jluuyjlgyzimxtylj5sh6igyffsxtyaf@qajqp37h6v2n>
 <epbqhjyfdt3daudp2wx54jsw6d7jf6ifbr3yknlfuqptz7b4uq@73n5k6b2jrrl>
 <CA+fCnZdJckDC4AKYxLS1MLBXir4wWqNddrD0o+mY4MXt0CYhcQ@mail.gmail.com>
 <ra5s3u5ha6mveijzwkoe2437ged5k5kacs5nqvkf4o7c2lcfzd@fishogqlatjb> <47ip2q7fc3q2igjjjg24bl3gwlpcr5y37pahkqb63ridzj262u@augjvsnpq4kz>
In-Reply-To: <47ip2q7fc3q2igjjjg24bl3gwlpcr5y37pahkqb63ridzj262u@augjvsnpq4kz>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 9 Sep 2025 16:46:15 +0200
X-Gm-Features: AS18NWBnjU96S1X9HzwLOYnj48ud-1aT029AYj3EOfOXKk4tlcXWbWhwT0m09CU
Message-ID: <CA+fCnZcG4Eqy84zNuvZ2Tumi=eA=KAGFFeduRLiUUHYRBMuDqQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/19] kasan: x86: Handle int3 for inline KASAN reports
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

On Tue, Sep 9, 2025 at 10:54=E2=80=AFAM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> But as Peter Zijlstra noticed, x86 already uses the #UD instruction simil=
arly to
> BRK on arm64. So I think I'll use this one here, and then change INT3 to =
UD in
> the LLVM patch.

Sound good, thanks!

