Return-Path: <linux-kbuild+bounces-8773-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 633BEB49AEE
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 22:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F379C208824
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 20:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98082D9EFA;
	Mon,  8 Sep 2025 20:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5aQeMCI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2735A2E0B71;
	Mon,  8 Sep 2025 20:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757362765; cv=none; b=Q4PZAOquPAaESJmxx1ZHq/VJK8xF57v3gaRI0qCNPciPvdjmNRxiGUKyscytJ0iSa5duBnVnVeqlZGb1VgBP5+bReskiCVPF5bGafLXIjaIRjwkrqYKpKQqD2H7WQJqk4ebhEbs2dpC4Ndm1osdtoVneZhI/47hBqZjzOLIEPyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757362765; c=relaxed/simple;
	bh=tQubbYkSPmW787uMDk/VjL70hBJ1by4E32yNlzWShJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AibYr3T8CrjgXw3tiGTjvndwL6nk5upPXcIslszeHgL/r5y7ZS8gyXmYjTq4Txx5i0VwSDebvURkwQ4XkebUgtydowao8mYV481rpVG7Y/xcpePBdAhSbAx+zkjNSxPm1Vvb0zRNAOMhG8QyJWuRQ0eXKpxF9lHLPhCxrXfrwX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5aQeMCI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45de1f2cdeeso11344305e9.0;
        Mon, 08 Sep 2025 13:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757362762; x=1757967562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wK9/DwHmthANAPoxGvgtMIu4IcfAIwwBdfEzyf7aCYc=;
        b=O5aQeMCIa4Tx2g0LgQ6uxeAkunux9V1BgZbj8GYoJmP3GKIL3Fbqru4/pKIcBWq0kO
         xTYXja+XgVgnmc3p7kUxlGGCxAKfy2PDzuIrOdmpQtJ6mr1cX7xqYlnFv7Dz/CHqHaPI
         K9e8UDq1f7LIkWbQC6jj3lHr1K/MOh2zKOfwtChnmL/npKjvFcds4uYt2vhXS6JxHR/v
         z9aKHcZmb8qPvYLTLsS5c9ZtDkG6wMq2mdS5vXxw1sXfYqCIvOWyKW658fONMPOMxjvM
         BIeZ4F5oubHdRveYvA5wW/TiRtCx9y40mdMpipLcEJ8+MOcvyU2BQudKe16JCti5mdfb
         iQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757362762; x=1757967562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wK9/DwHmthANAPoxGvgtMIu4IcfAIwwBdfEzyf7aCYc=;
        b=XJWSL3Y3XXDVFq2hf+nwiRWjSG/SVP1ttPvuAm4cY/DYOy481uzWgINBaS+odUalPo
         fWgDQMxtvvgfMc2sEB8D8wwEPl7rvoHGC7bTGzvyhQWlp1Q2NpMy/E7rGHHZxp/a9Ppu
         M5KJt1WVYmdeTjdDwTYmJbjzKnGcEvnD/uR+Se1kHjUc856+zcTpKREteQgNbNMzoQAb
         QKB22Y0CRLYPOcZHPA12QpNZVxs4OxZmvckaCJEQI6MQwQ/ldzm73VBOgOjDTWJovEIt
         C8u3AhH7zyRuA6XNSpdeUH1xqzu8IJLOQXZ6O1YXR/U7SNYrbxP86tivLPyxhDFi5L27
         KjJw==
X-Forwarded-Encrypted: i=1; AJvYcCUDd67KKXRijj7uvR/B4z5usbkicWWdfydr5hGBp28Q5gYFsQ0vjcD5U2AOlMHVssxmC59h5a+UAxZbyg3U@vger.kernel.org, AJvYcCURXWMuvstP6sXnUAG7uCp1mDqVG5DjXxk8d5CZefqBTNLxMeBW9jfTSDEAxxlO4qcL7Zttj0NJRURmhMP7@vger.kernel.org, AJvYcCUy2BtJhuaZUdAi1xPuxk2ucezm9e/pGvRNZ9sMa/+6tjDnNl+plPf4oh3a/FmRvM4x8fgV7JvKlpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqHTB2gNucg9+huuiy4bRcWsG5qziD1cb41R7vTJSt7vKEgKOH
	GN9rrrTdvtLL2i3W9fyZNhLG0FeRPqzZpK1s9blsXk3rnoldHiz4OACzuVJTiWrH9Hyyuh9vr+K
	UThQex2CDg8nj4QO3fXbhMndPkGN6bZI=
X-Gm-Gg: ASbGncuJjlsDLHE4Ml3MH+eojgnfnok9p3xEa+l0NsK1Bxq9pqO2aUfeiMrYokm7VIQ
	qtBqJlFBAcBzCA2rHeZu1WlwBDE0dS0uF+sXROaC4FkZxwSwk/Vh+sBtnOl9w2lkHYwEwLtiP32
	oe55LEfzYQk51h2y0CG7rGXlkrMZibJppDAxA7xaFQao+CNjavrBTig6/bHM+FZX7Zico+pzPx5
	GF9WcivpWrLjHfSyY1wtTo74+qQQw==
X-Google-Smtp-Source: AGHT+IGZZE8d/HSpoC7P4Nb+5HTeJindRu57Gsc+Nhd8qWOwEu57WmXSWCXboRHxBoCyR49CB3xV2W8zqJ5HdS1yk+8=
X-Received: by 2002:a05:600c:1c97:b0:45d:e54b:fa0c with SMTP id
 5b1f17b1804b1-45de54bfc44mr65122055e9.17.1757362762024; Mon, 08 Sep 2025
 13:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <2f8115faaca5f79062542f930320cbfc6981863d.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZf1YeWzf38XjkXPjTH3dqSCeZ2_XaK0AGUeG05UuXPAbw@mail.gmail.com> <cfz7zprwfird7gf5fl36zdpmv3lmht2ibcfwkeulqocw3kokpl@u6snlpuqcc5k>
In-Reply-To: <cfz7zprwfird7gf5fl36zdpmv3lmht2ibcfwkeulqocw3kokpl@u6snlpuqcc5k>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 8 Sep 2025 22:19:11 +0200
X-Gm-Features: AS18NWCIvLKT4zY1Ax7hHZz8nFS_pHxT1rFM_aQWd_F5XVIT_8vgGZz-WQhHzM8
Message-ID: <CA+fCnZe52tKCuGUP0LzbAsxqiukOXyLFT4Zc6_c0K1mFCXJ=dQ@mail.gmail.com>
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

On Mon, Sep 8, 2025 at 3:04=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> >> +       if (kasan_multi_shot_enabled())
> >> +               return true;
> >
> >It's odd this this is required on x86 but not on arm64, see my comment
> >on the patch that adds kasan_inline_handler().
> >
>
> I think this is needed if we want to keep the kasan_inline_recover below.
> Because without this patch, kasan_report() will report a mismatch, an the=
n die()
> will be called. So the multishot gets ignored.

But die() should be called only when recovery is disabled. And
recovery should always be enabled.

But maybe this is the problem with when kasan_inline_handler(), see my
comment on the the patch #13.

