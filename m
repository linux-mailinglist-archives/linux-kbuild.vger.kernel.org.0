Return-Path: <linux-kbuild+bounces-4021-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A9099808C
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 10:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20BE61C27492
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 08:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDAE1E5737;
	Thu, 10 Oct 2024 08:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEHMlwgD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1834C1E572C;
	Thu, 10 Oct 2024 08:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728549037; cv=none; b=s36FZxXr5wCOcIf9u9eZICBzK6VRw7FbWvzxFE1NItTeTSZgy/obvR8JJv6a8VhT1Wmmt0QUX6jBMLPNxF8irfVp5/MJQ5KDBlGX+CfHANgljw+ONf/G+qAbWkXgZVSRimd94U6c3Co7cWppOSxMKBPU1/FmV2G/wU0QsNReEO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728549037; c=relaxed/simple;
	bh=+mwfCV5Xaz78bJIAQCoJRY4hO0RI7al8uPck8YFKoeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a1PQZaR9fcLlKE5XEJ2ZO3v462xljWMCgqwlbOBM8tBEGyYHw1I4aYzcVQQhWJ6J5QHkEWTBgq+2uyPTEtQ0RGdfUMBW/0Nq4iygi3RW1eQRFZ1GBZhLwFpLpOjtR9hwLIIRgt18QBKaU7hF3E4ENZ1VvKQJPZ7rg3gOeg0rCyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEHMlwgD; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5398e53ca28so639393e87.3;
        Thu, 10 Oct 2024 01:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728549034; x=1729153834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6K5e5UuEzDWXiQ3PgmTy2pOR94vNJzdNel9NAMV4yRc=;
        b=OEHMlwgDHT63LnfVcvuMPnxGXYx9omZ2d6bjr9TR/Xql2dAJ/UeeqyLF7EDjNFH6MJ
         eBQBMn5xTWXC8eRlrAuHvntdkGhLmINIRjJfDzrisSTkwWhjkoyVAUCGPBHsBlQNV91f
         ap+tfAWd48/7u8MKF3wyebKYrIMp+rEN6NvP8N6JhFzqRlI2saiXetG+onElsJCauFKy
         Wmz+n7FFbXGSV/a4ov4LfJ+NcaOWJtL+gAYlDlaq9dNGALMZW4iQ184W1rGkvKfgH1pl
         LSdl0EFalHSokghIkLyW/nGLVQ03MU9dO6JUY8Kkq9VplJswDYZCVxBtC1ZnDb+aFHih
         k2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728549034; x=1729153834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6K5e5UuEzDWXiQ3PgmTy2pOR94vNJzdNel9NAMV4yRc=;
        b=Rnlatm9uFhvNrao094Mko76FNvpiXQL4Ww1snGegwxjRv8nShrwTgXL1V84bI2HamS
         wMox3xEKcpQk7zb+vrd6/ssLgXusWkBTJmGhFR1A87lGKJm0mi6TCLuagJ2vdZ2STMWa
         CiRCOe7qlFCq8ipOLp533+JsMyVOBouG4DBnDXy7/srzfbmgRXGEVEoFK9++R9M4DQL2
         2TmyHLvO9Pb3c6AykCmwuuu6zzlF/9qo1MmTgC2Ymz9w6vTnK8Fq+cfo7962vmL2r6s4
         Hn3JdBIyNpSUatrUIBtHXDo+eucgP/gcVxvYbgJ/yjWK8mah77geffhbuDRwvGElwIoe
         sgTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcw3zbY2hW410WFUn/pGlIzD14N/JmhII7nHOy0BlT72t+ySG8LWkqd2gbZdRrq/8jQDIQp1kv6X1cHx3a9A==@vger.kernel.org, AJvYcCWKgJILFakdRNbsz4dvKYcDijgNHs1BEG/On/Lr1bedYyHz4Sc89O4JdlveuzK8IDks2+4Dt8wMVvLxf3nT@vger.kernel.org, AJvYcCWQjt/m5HKvGRH0mlOSCJJB+mS/qXErkM67+2E3HHCpmmoGmPr3EVSEdxMoTk/Vxr1gTe/f4QDs09pEoUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1pTO2COKSsZvxxVNL+HeH+KV4zjJxvFCT3sECnfogRY5WgoBR
	p0HG3kzIOnSsA9GJ3k8d5k0aniwjdm/oPB+y8Igf7KjAcXq2o1gw0cQ31rWjfvaHjwRpB9J1Ga0
	AkPc6deoZyBeUJPDuiWQQULsxCFdsWOjF
X-Google-Smtp-Source: AGHT+IHW2rWv2FjlUD4PnKhrCsRLnkCbi6EGrXvNAggFWmb5dnRlFWNJzTzQl5lYAYssfabEQSk0RNg0mbjhEVGoL1Q=
X-Received: by 2002:a05:6512:1056:b0:539:9f21:35dc with SMTP id
 2adb3069b0e04-539c4981051mr3469810e87.57.1728549033800; Thu, 10 Oct 2024
 01:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <42aa307d7ffae1851b4a8787f5c276dd0b3beece.1728543368.git.linux@leemhuis.info>
 <b32f1e42-d775-4538-ba36-9e9b906a34e3@leemhuis.info>
In-Reply-To: <b32f1e42-d775-4538-ba36-9e9b906a34e3@leemhuis.info>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 10 Oct 2024 10:29:57 +0200
Message-ID: <CA+icZUUgwJWY=PWO5fQPZbUc-q=LkdHXVe4+g-LnXmQfCA3N7Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1] module: sign with sha512 by default to avoid build errors
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	linux-modules@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 10:19=E2=80=AFAM Thorsten Leemhuis <linux@leemhuis.=
info> wrote:
>
> On 10.10.24 09:00, Thorsten Leemhuis wrote:
> > Avoid build errors with allmodconfig on Fedora Linux 41+ by reordering
> > the Kconfig choices so modules are signed with sha512 by default. That
> > way sha1 will be avoided, which beforehand was chosen by default on
> > x86_64 when running allmodconfig -- which on the latest Fedora leads to
> > the following build error when building the certs/ directory:
> > [...]
> > Link: https://fedoraproject.org/wiki/Changes/OpenSSLDistrustsha1SigVer =
[1]
>
> Sorry, one search-and-replace went to far, this is meant to be:
> https://fedoraproject.org/wiki/Changes/OpenSSLDistrustSHA1SigVer
>
> Ciao, Thorsten
>

Hi Thorsten,

That was wrong in the original code which you moved:

+config MODULE_SIG_SHA384
+       bool "SHA-384"
+       select CRYPTO_SHA512 <--- SHA*384*

BR,
-sed@-

