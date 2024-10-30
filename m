Return-Path: <linux-kbuild+bounces-4429-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C959B6E90
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 22:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 902D61F22E68
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 21:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933442144A7;
	Wed, 30 Oct 2024 21:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ry2af5WU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785A22144CA
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 21:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730322889; cv=none; b=uDGOLOnmv/RbrTVYT1PwSCOgBPnpW1ARgsgb2JXVb5/kLXoKqxvx361WWAsqPIOI9j7B4OZuSUAAYGWZE2Y4OSgvzStNfbB4qmiXIggKtW4ljKEW+qAVwmcJ5TF3uV1+fA0mRhp7tafB7yMJtsqujzLOE1D6cF+99T092Bm48NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730322889; c=relaxed/simple;
	bh=o534AfqHtN7RldxfitzK66PsnDX4NhPFj12yRB4Rmbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkQSAHJ731HBkuDtYvauYfUzou/nDZRyNQBX6p8iyaPLABUCGD6uiYrW4wc3YmK5HgSM02NEevdEVeWZ+ILfnpmx8SiHB7gIuzH23oKzhxrKMP2OsDWss2vIdYEWcp/pj+ZGapu/FGntcQvMLYB0/6XErwL+T+VsPQvSIXi5Yog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ry2af5WU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43150ea2db6so37295e9.0
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 14:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730322886; x=1730927686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o534AfqHtN7RldxfitzK66PsnDX4NhPFj12yRB4Rmbs=;
        b=Ry2af5WUv/skSRNxT+7siplCwQWDhKtQfIsMjY9CKz4eMhiDaZX1feC5lYAe1PYbNz
         KNoCsxFUr1uBOAwYpDz8pWMPcz/SQtxG339IHGWDwqYztGZqfo22sfw5XoOMvVZJsl+f
         +twacZr2LJZsSmJBtLqUo4nwKOY8IxT/enb/U243vHrgZuhK6ZdUTMg9FPxNHD8lWP+K
         riMozXWSdTIv1OQR3UtxZU/nF3JvE8oOoKSnTlNpAMZEYs87ED4gijbier9TavT5e2pP
         XCwBYmqUx8tfgOtIIX/fLhhgI2Jfk1fqWyDYH2f32yzgDByNWx9UEjFSvRQbKWTsKg8E
         aABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730322886; x=1730927686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o534AfqHtN7RldxfitzK66PsnDX4NhPFj12yRB4Rmbs=;
        b=wZN0SU+5yz3Y106ORWKjLD2vb3TL7lAjmD1qS1m4x9Uzz4d/zacgZFVbpqGG76OGKU
         CGa0O/kq8NxuVGkSdVTDkMc584xpNgno98Pme+ITdVwJ82eJiafLJGRgFcazbGxcFCyn
         R0UL6kQ8lkLbIhRJLsk3b46uvWQxuu67uvnnM5CyyYBDj2QpT0iXYrzogS5ZGZVh/ppP
         2635BxrD3WcsGYrFatXWSoOExRDFjjzwNQXCvtwrnEby2czwOdUqph0eml8ttNRVtze4
         fOh/lBuySsuSoxxEPOGhgC5aopGwSZjF0fec/a+MtrJpd8Flwl4QTm3m8o6pCDhx9kLC
         uIAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX7+lHYm5ygq2QgJAyq8CmRflRxJrmaV+2PQmn/m3hMU2RcFC0TMhowPuDJxW02VQmsFlRaMc+3/yFUM0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1xSie7nDxiBgrJM/ZY0vnYN3lTbegDNHXnfNZdlAJsSP7rVPw
	VKuAAekoTi/smtahuJg5Bb2vqVpdfGPpsnY5Cj/gxBGINIwmFnWFGyAZAVHqELqyl7xFTiuKV+v
	stqWEdSENzjT6FfzcOKaxAgMTgLh9b1nDy+D2
X-Gm-Gg: ASbGncu74zofU8YNAlyrkhtHfBwyF1isI9CSbWBk6/IUuZnQxdLZkanzw8r52L+RJjp
	uWCKYG8B/cRT14xt1kG+QHxHZFPb9069R/7BkxGGB8skcQFLzI0wgWiuKKEHJow==
X-Google-Smtp-Source: AGHT+IGpbeaz+5KppTzbcYqEE1yAqTgZJWcDUhQHhbTL7VnBBuh5AYIfWrbwLxtiZ4nkFcdHa3790grpJGu5v7MdZew=
X-Received: by 2002:a05:600c:c8c:b0:42c:b0b0:513a with SMTP id
 5b1f17b1804b1-4327bdca213mr1401735e9.2.1730322885602; Wed, 30 Oct 2024
 14:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com> <CA+icZUWTdgM7HQrnR_NzgZZQE3aXXk+tAqD3srNd1Eyjr5d7EA@mail.gmail.com>
In-Reply-To: <CA+icZUWTdgM7HQrnR_NzgZZQE3aXXk+tAqD3srNd1Eyjr5d7EA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 30 Oct 2024 14:14:07 -0700
Message-ID: <CABCJKuepGSFcQa0F5iO4aa4V2UbhuKO+tyfhB3_ODaTGs3sM5Q@mail.gmail.com>
Subject: Re: [PATCH v5 00/19] Implement DWARF modversions
To: sedat.dilek@gmail.com
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sedat,

On Wed, Oct 30, 2024 at 2:00=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> Hi Sami,
>
> perfect timing: Nathan uploaded SLIM LLVM toolchain v19.1.3
>
> KBUILD_GENDWARFKSYMS_STABLE is to be set manually?
> What value is recommended?

The usage is similar to KBUILD_SYMTYPES, you can just set
KBUILD_GENDWARFKSYMS_STABLE=3D1 to use --stable when calculating
versions. However, it's not normally necessary to set this flag at all
when building your own kernel, it's mostly for distributions.

Sami

