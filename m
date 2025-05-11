Return-Path: <linux-kbuild+bounces-7079-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C04CAB2B3F
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 May 2025 22:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E42D0189677E
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 May 2025 20:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA8625E45A;
	Sun, 11 May 2025 20:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxMX8Rs6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35389258CE7;
	Sun, 11 May 2025 20:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746997146; cv=none; b=nR6VOzLlS+GywoZYdubPW38acu8gxYpfc1DJg5pBZNdSUux43lEn1lZOmbr8sYh3KuRtidHHT4RIraqLUn6gv+uQrMPDRWdyEKO5k3+ksHn5jsN6+zYEFOdHKKwlvPKeUK+ztTfW+fZpa8QuxgP7XB70Kt/Of20dyeeqZGtUPdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746997146; c=relaxed/simple;
	bh=I+7mTqz9bA7cqWlrqsmkwHvyBbp/D75ty5hCJzxapuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQnqAmnSS9tPT2QT9yN8W6sz9CA+MuIFCkKp3DFR/OaUhZ2uQJeCpjpXpXoqMfg/Jr0erMPp4lvXoOaZO4EP0tksgMB9VfyTZtkU9kkx/GmfxhFV6SkJI3khg/GgTBx1GnB3oq16xB/fW8vquQGemb1ckgtarimSBCvgQK1eH5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxMX8Rs6; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22fa82144bfso2748615ad.1;
        Sun, 11 May 2025 13:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746997144; x=1747601944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+7mTqz9bA7cqWlrqsmkwHvyBbp/D75ty5hCJzxapuQ=;
        b=IxMX8Rs6wxkL59yGauijt1+D3H9ej0mN6n1AhSU9S5Kpa74Ehaocm0X/1Vhcajl1rt
         wZILrTd36WkUuNIeUxHV7bLBFyvLZXMeETI9Vv8NCVazlfwnu0HA+74w+yApE1OSauQJ
         E0U5y5jujyRuQ77RiAgBO+Vek0mVjnbdzvMBo+WxvR6MiJGRCc6A/gf/MDCsWwxcwt9h
         avau2d604zPgts6K905VIA5YSGTAVaFO/yirCx0Tzgh6Fep0Wc3leDyhchRfE/YfrN4d
         v/apP8m+5ZkRCuf7enPX7uJ4udcDyWeuJcWBqkooNSMn23iBfthzrV/QQz9Q+aS/2pJQ
         W/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746997144; x=1747601944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+7mTqz9bA7cqWlrqsmkwHvyBbp/D75ty5hCJzxapuQ=;
        b=kO5G8Gqwy83DkJea0m9QVwjrW/OhYBGm56hO2vweDn22lQW6xOnKMCj+La+Qptj8XM
         ZB85niPOh3kDuBphi2jm4rXUcz5rVH7IldFP+yZPYEbYVBfdKML5dyavqUaa/X7vLsqJ
         Teaw9TFMCl933uigzqzM5kMFxKTo6/fcjNqgXTyYlaORYPB+ado0OHTCbG9rR96P0BDx
         pLFyLIewuR+ar268jfaxddxsPX076jtopxoTF+jmZ+NVsbdMwNW0DTATPLMHdji6GTn/
         q8PzXTQAOBbOAhKAXi7zQHA87LOimWoJx3eAnYJKvIeFlIVyfFAnsQhWY7L1rzUI5as9
         Vibw==
X-Forwarded-Encrypted: i=1; AJvYcCVdocL/AuJBEJ8OJz2kI0bnveyO6KMdHTxHzRFNTBbdFyPuhBbzNoooQl7Uw6shub8IJ08MQXw4tUopZQuk6JI=@vger.kernel.org, AJvYcCWu7I7Bp2falV5PLOu0nx1iu8aHB1e0sXsssGeExhYdDJBUKzzi19Rxv+hi2llgljUNa4an1wpL10VzvBqY@vger.kernel.org, AJvYcCXJemPjDDWFOZI1Ms97W7UQ6KEMm7w01vHKiHCxsflDtJebq061brnYn14HB/lvUeeWWNEzZA6yp9M=@vger.kernel.org, AJvYcCXQbCLFNYRAk2PuOcD8ysjuQvI42/gxEb5i60dbXYTR2IFVBzwifQY7xDoAuR1kA//pa4hAz98mteFeYvcL@vger.kernel.org
X-Gm-Message-State: AOJu0YyR4hcUw4lWnLlqtX+dzISIku6JDlDGY+3APE+XrZPx0c+yALKT
	VZFYWMJt0anDGNOWwIa8POzSrCbG4tQIH4EgdSj9RKdgC4APge2rfpTChFtiVHQH6K7VsQYjxRQ
	APSWJSiofOfIct4Jn1gfNaJjbYEk=
X-Gm-Gg: ASbGncvVBBqTCKWzVLWanWui1gNg5ASig++Mw4MmCttBrJKlVTLU7htkEx7enbHVvPc
	fgoYRGWrDSL/laEhAg04b/tvacfc+GhYxveB4rHWGXX60lBd4n4WUXoYFNFESxlBo6cUa6rp5ca
	/oXHiLmcz6XLscsp8qODlmh0hsctWg8Enr
X-Google-Smtp-Source: AGHT+IGSrGXIc0eSPEVvfwMhPcBBnCBF0LQtW092lfGKgpi8JT+asR257TaRW1aiJIpUZmH6wwrGx5MuoNcO58snZeQ=
X-Received: by 2002:a17:902:ced0:b0:224:216e:38bd with SMTP id
 d9443c01a7336-22fc8b3b40fmr68532115ad.5.1746997144342; Sun, 11 May 2025
 13:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511-kbuild-revert-file-prefix-map-v1-0-9ba640c8411e@weissschuh.net>
 <20250511-kbuild-revert-file-prefix-map-v1-2-9ba640c8411e@weissschuh.net>
In-Reply-To: <20250511-kbuild-revert-file-prefix-map-v1-2-9ba640c8411e@weissschuh.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 May 2025 22:58:52 +0200
X-Gm-Features: AX0GCFuCunDLzYkVoSEQffxotswvcpVe2KNib0F5mLDPZUIE28H55TOFXZWjOEc
Message-ID: <CANiq72mrXv8JfsOE3vERAZCVhXs5JPsMRu3jAPPoNzFao2qdjQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "kbuild, rust: use -fremap-path-prefix to make
 paths relative"
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthieu Baerts <matttbe@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2025 at 8:02=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> Fixes: Fixes: dbdffaf50ff9 ("kbuild, rust: use -fremap-path-prefix to mak=
e paths relative")

Double "Fixes:"

> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Hmm... could you please give a bit of detail on what workflow breaks?
I quickly tried to open a C and a Rust object file with gdb and it
seemed fine. I can try later on after some travel.

In any case, Masahiro: if you need to revert, then please feel free to add:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

(We can keep commit 2c8725c1dca3 ("rust: kbuild: skip
`--remap-path-prefix` for `rustdoc`") since it just filters out; and
that way we don't forget re-adding it if needed).

Thanks!

Cheers,
Miguel

