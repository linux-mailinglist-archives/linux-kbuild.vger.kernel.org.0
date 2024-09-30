Return-Path: <linux-kbuild+bounces-3836-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2E298A75C
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2024 16:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 741D3283671
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2024 14:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CBC1917C9;
	Mon, 30 Sep 2024 14:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mU+9UJgW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8C3190692;
	Mon, 30 Sep 2024 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727707037; cv=none; b=Xd7VuaeWmdnBvFGrAe1pFB/76hexiyNyHoEFtE7uB+45mDacw0rKjR50m1vqVSKnG1sw/RxyxdMa1yZYPNg48nYcffrJ96WqwFuUmKdKVKJZ6T4MVVMXGF3jnqg27EJo474OUP0G+r6ssQ2xM8NtngEDhsg/Liof7vnd8JHKxwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727707037; c=relaxed/simple;
	bh=SxwHnpac1WPdo6ztECATlxiDX83RoFq5U6zGQTNqWTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0VOScBCuIcBEHIMLyd6/4rItBKxV2zs9gdbfhM6pCZxgDWxVfX1AL61rkW9zRZTtoDuXPBJnZCBbL9R/YgINfHjtuGj0oyYES3n6WlGHWXzkfwnvf8tpRyxEkxwu88iPhsB1Cfv+fv1iaWHq4LaXOphu9o3RT3qj3QN3T/Ycnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mU+9UJgW; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71829963767so332959b3a.1;
        Mon, 30 Sep 2024 07:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727707035; x=1728311835; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJ0acZVpTd95G4V1SXDnkyRnYouhvyLUEZ9mKtxGhDo=;
        b=mU+9UJgWq6SXkzFznVADt3XMXstKW6tmPhg+6h0iP9NOTkznQkwaE+Gc2xo250MOu/
         wDrC+OY/nqd6bPqcn0oP9Rs/xJXbn+1QtT3n4a76EBscIpI0RTc9mau1eaopXxk+EXw8
         zc5/L6Bh1EuwbwNWUO+TMmZphcmC5DB54dkcKofOgfaWAGQAM5y7Z3V0djD4w4FKrTjd
         q47xvgvC00WjR+D62Ip2dnGNaSiLTQOwWyqWF8TgTeP1yLjsxw54n22RMBZ6Mt6ndKjl
         WZQYSkygbns9bql38Tmck+EUb/8L9dZbiKT3PylYjqHNl+XzYJS3WZWY1iw3hIWEoftV
         9lxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727707035; x=1728311835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJ0acZVpTd95G4V1SXDnkyRnYouhvyLUEZ9mKtxGhDo=;
        b=Km+R1Ec6KDz/qlfJ1gPA5dgMUuJqmbYPjjDEhwURBswqir69zKkzwilFqUiHyyTVE1
         lpsmJ+B3sGD5sWvbmftzHJp3rCR4nld1Yd8zWBeDetx2fpNj9ra5Htx6cKltyPHC0OY5
         8MIf+Q1Z4Wye/fNaPBt1+h7l70y6QU6eC3+XP4gNGn6uUamYnP2RZ9NNpPBQhf6dioow
         TdHg1AKXXkQpUykwHnG5KMAmq9g7g6ALUxtdCLKDU+MRYEAmFCLlq9eHI7MpZoSKeEGJ
         Wei+2+rjNFT/jNB0phkB3So53aOiJ5pvS2LCPGq1JYeI2JG1vU88uCzBjqwMBhwCYpVC
         lGmw==
X-Forwarded-Encrypted: i=1; AJvYcCVpUJDV1TNzGMSVsE9Tw5TFQzgLjn06xkI7zsquJfI/dqovDZWAqo+IdK8xql9HI950iE1iJ5h+/UqYAJ4=@vger.kernel.org, AJvYcCXbczmINwte2lNFnwXi8/vLK1hWwpguQp/DWmvSv/vaOA3S1yVpDP3INe6hMi/ME0CJF7pQtrHFeqiAxzem/tg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmFd+yQ+wDYECzUyORFzhL2Uc3NVPoYJ9owaKr4bh/c6grfZV4
	Aq+Gk7W39r9+7BkJOYy7UOjY2xRN9KrsUhTKEuVzz9ulusG5k9QbS7tXCImETG2W4OztI+1AKqH
	rqUWCxzx/bcDTkoPh9zoRf0pWW60=
X-Google-Smtp-Source: AGHT+IHXBITCQHq31xGtqm/iqPg1757w3dsrvH3jMD3qu7FcvDv1u9hgLbXdLn+efRuEinvEtVHU2vpiQW1VL4+fOv8=
X-Received: by 2002:a05:6a00:1990:b0:717:8b4e:98ad with SMTP id
 d2e1a72fcca58-71c6352f3demr5113469b3a.0.1727707035319; Mon, 30 Sep 2024
 07:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917141725.466514-1-masahiroy@kernel.org> <20240917141725.466514-12-masahiroy@kernel.org>
In-Reply-To: <20240917141725.466514-12-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 Sep 2024 16:37:02 +0200
Message-ID: <CANiq72nN6sAJfchmxg3GQgR2NqfnDzOTWzXYiMkhiEgcwpaJXw@mail.gmail.com>
Subject: Re: [PATCH 11/23] kbuild: check the presence of include/generated/rustc_cfg
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 4:17=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Since commit 2f7ab1267dc9 ("Kbuild: add Rust support"), Kconfig
> generates include/generated/rustc_cfg, but its presence is not checked
> in the top-level Makefile. It should be checked similarly to the C
> header counterpart, include/generated/autoconf.h.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Sounds good to me:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

I also tested that it indeed prints it if removed:

    ***
    ***  ERROR: Kernel configuration is invalid. The following files
are missing:
    ***    - ....../linux/include/generated/rustc_cfg
    ***  Run "make oldconfig && make prepare" on kernel source to fix it.
    ***

which is nice! So:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

I guess this tag may apply to the previous patch too.

Cheers,
Miguel

