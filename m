Return-Path: <linux-kbuild+bounces-9575-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB1CC4EC6D
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 16:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 464FA189E606
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 15:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71293659E2;
	Tue, 11 Nov 2025 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1wlY9uu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD043659EC
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762874725; cv=none; b=WIwMdez3y8qnfFM5mzMs4pPBtXM6ttURHGvBobsLgcRTtv3yNX93p81AmNo6k4jxpX0xUlzjIqJpkRVCIN5HCTPJFikXgu8uatzeeDRvG0tud0lL7VjQTf2gfH8gj9DEZ4PJDrovTkybgyLfhCbeWyTtDNbSOeNpTGP4sCBICtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762874725; c=relaxed/simple;
	bh=kH2n8iyTfgAxz6xqhPaYcBszdchDNAlkl6wsHl2bXLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/Zb+Lmrwpr7EN2S7Y4w7Se4wIqFdHRuSrVbjq9gUz4eIjfTNObkj1VozW0g1zbVsVBc7Z6+KCkjPVrSvCj2q/J/V8mkkmTTOhk3qNcRndPQLpx+ogwXdvDKvryHnqsGoIKvK/QtxN/VNwTarCzuA026d7j2Kx0c9Ww9TxiFZ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1wlY9uu; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-376466f1280so56302281fa.0
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 07:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762874722; x=1763479522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kH2n8iyTfgAxz6xqhPaYcBszdchDNAlkl6wsHl2bXLA=;
        b=T1wlY9uuIBJOoaom8q+pU3Ew+ovnvnwgbeFT6DNqOzxc17R2wq6OHP1jZN36fZVZFA
         qmYgyMDj+/2s1sVW7MVBjxMbpOfkCFWRS+kY3xo79G4ZIQtswVLh+9CJNEFyNxsdBz6h
         IqTZZrgLtMjb2kwbspqmcdMrcCjdoOnZc++p87074QOuGvi44zMiHWjrwo9WBb1AS6zq
         2g+Tfml17OcZGzLFFbD8Bjbt4eqaRfwwRNLr3JFTjxvWdt+Vzlg2bVKIYY3kpbmNR9v+
         6EPvWcr7TAApF/xiHk07HMXmH5LBUuHKndKSmXs+4TzhsdrFZ9iHLgWqAkiuakklzPka
         2ZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762874722; x=1763479522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kH2n8iyTfgAxz6xqhPaYcBszdchDNAlkl6wsHl2bXLA=;
        b=Rel2L1bJC5uRhUdAvSRCZXewDlrFR3m8zwYL7XKbVdGIxccARs1LbbzkBxmGU4BGmz
         yaqFTH9l+KHV5WMuv/TSfrdKGggYmJ5Wez1yewJOWc+NzsxiVTv4zK9gWVSPu6U7JvKN
         d+kyO6VzQD4sOF8TDYMeR3BOO1WRzE8nzAuMBiAIQBgNYvsQlKQZv/4N1VQ9Y7s4qDw7
         +Q3jZBZZqZkhn9hKWV/BVufh6tbJQqfneBYWUYjt34d/txqag3eMdJnVAt0NyqAC1y+t
         ZBcZ43XZYHWPOVS8a0cfgnh5GphAbX8ghHtGwDaOxMe6Tkv+tMIIpbwTVAUpGLUIs8IR
         n88A==
X-Forwarded-Encrypted: i=1; AJvYcCUJ2wL0lnrIMydKabGgNJCRaPGc8c+y286DhQHsf4mhcJTXAYPHaLCDLEplO/CyU3d6XNHLhN1nGeNdQPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlID7m/a9YOcHAkuHhycmYFAo3MoaK321AXDNVgozetQ8mMZO8
	Q2fwnsGelYAi87mYYJCoUYgaN9F7j4CP+xqCW8VXQ54Glb7kTV0FEovcDhH/LzZnHHKJyz0o3EC
	eRPp7dE/sNp8Cbe+W0VCIpfR+Q9YLFjE=
X-Gm-Gg: ASbGncvgqdI3P7MJZRkgtldyN3o8wA9sfMiTOHzDHtPtkTzUzrTBm0TWy4+7ZmTZKdo
	myrofRc/lAQiSkoBczJHO80WSockEzk/6eUh7DdI06+7nLTL7OZFAZmz7U+PdQ1Tm79W+WFtpUK
	OQWIQI9a/m/2cNg3hg9G+wkSZr+7oDvtYLn+YM2PagUiz5rIEQxCD+AVTsF4KsJQtwug4GhXXxJ
	IpxCffxngWS2tIDlp8ar9Z5uGZILe1DOXhGsaXJm3AkXFbPTKyBXolRQGQatA5K6sy58t1Eqw==
X-Google-Smtp-Source: AGHT+IELN2Wzp2bTqYWDhcQjlFtX9DA00ce12BJNW8cO2c8JdiyexJqlAubB4Ie5Gjviyerq6QZ+GfCfwjPRPrxTi4A=
X-Received: by 2002:a05:651c:f06:b0:37a:7c41:79e with SMTP id
 38308e7fff4ca-37a7c410bf5mr32947351fa.13.1762874721655; Tue, 11 Nov 2025
 07:25:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110131913.1789896-1-ojeda@kernel.org> <CANiq72mjFobjfQEtNvk9aA+757RkLpcfmCCEJAH69ZYsr67GdA@mail.gmail.com>
In-Reply-To: <CANiq72mjFobjfQEtNvk9aA+757RkLpcfmCCEJAH69ZYsr67GdA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 11 Nov 2025 16:24:45 +0100
X-Gm-Features: AWmQ_bl70oXfEo-1yQ9VfgUdYtwxWC_v2530llNoS_lks6MxxMHeFjNTi0L0Vkg
Message-ID: <CA+icZUVcHfLru9SRfhNGToiRmyOY+fLw-ASEvQakZYfU1Kxq4g@mail.gmail.com>
Subject: Re: [PATCH v2] gendwarfksyms: Skip files with no exports
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 2:58=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
...
>
> I will send a couple other fixes to Linus this week, so if nobody
> shouts, I will be picking this one.
>

Hi Miguel, Hi Sami,

I switched over to gendwarfksyms in the very early testing days.
Faster builds. DWARFv5 fan.

And was using v5 of Sami's patchset against Linux v6.12 as it cleanly appli=
ed.

Last week, I jumped over to Linux v6.17.6 and the next testing will be
Linux v6.18-rc5+ (upcoming next LTS kernel-version).

I will try this patch - might be you will get a Tested-by.

Best regards,
-Sedat-

