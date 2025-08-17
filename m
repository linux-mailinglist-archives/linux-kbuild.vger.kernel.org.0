Return-Path: <linux-kbuild+bounces-8492-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8A2B29425
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Aug 2025 18:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B6755E314B
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Aug 2025 16:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C0024469E;
	Sun, 17 Aug 2025 16:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoTRdFPW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2ED72634;
	Sun, 17 Aug 2025 16:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755448281; cv=none; b=pBRm3pFoCQY9OsrzyJTWlwERYQYa9Zkm+f3o2ftWquZf1gvboLqcnLkAvT+cvTItCaD3s9sqlK35fi8UudVk95WrxmKd0Mov/qA0vcfNFBCFoP4xsDkQsDkA8PbhoBM5QEJvrGraQv9VIW21+Ex7VN5DMcOKw3v3Rm9GWGeilfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755448281; c=relaxed/simple;
	bh=kLFLEqW/OO6iFtOv4aQQMv287DbBHQu4/itQJciHqy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iox9H26pX/hAR2ql4GRZ8paI6voJng2oTXvVuA5Z107JdvKjDAjEq1MeCIwQ5XjAAjzknwsDsiaS7XxD+nJydv9BUvX3MPr0YGkuLogYkogFF4ZWG/QHH9gdYHq6qRyD06JGTDVncodHemQankh9fs1lsIEUtaeOV2EZIXYhGkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KoTRdFPW; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b4717593371so508730a12.3;
        Sun, 17 Aug 2025 09:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755448277; x=1756053077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLFLEqW/OO6iFtOv4aQQMv287DbBHQu4/itQJciHqy4=;
        b=KoTRdFPWRAg27GLFE/h8nLtujeUq/xuvaNjdAtEIAzbZct9GOb5MITtnOxkN29mHTg
         WylIKUzsCyDJgXFMW0lkKBGGxfzR4A+pnW0092zM+CTotV7wjH8/a8+X4j+LGRU2Xmvm
         PvsbheOFVOtLuhkLGOrigLtDxYrdFM0/kBHK4bKcMqkY/RM6SXmPJbFnkRG7+nmGm6NQ
         iK9xfhHOGSUpi6Gsafx2WJSlmEyVJubCLdadY1D1Mfap/wQIUOGfhfNDAjRm6p7Lwxqk
         29Nh/aKgcgIq6Vn2e+UgihmJtjh0432VoZO96pN0VvTKjeHhfl5I24ONmH7sXc+1I/SS
         dJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755448277; x=1756053077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLFLEqW/OO6iFtOv4aQQMv287DbBHQu4/itQJciHqy4=;
        b=cMekrMXbGn4Exahso8448KlrWmrNtJXf56PMyUmB7Mgdzw2H44cZqtODrS4S+eFXJp
         7XzdQlGLT0ckPmcePqsz0ECOObEgzq+IYo/mzSB5IEVCDgtHnvtqYtpDJhda63+94HLN
         km5oURKNpoQAi9hW56R+FGFUoMNe+p7YCF3AUGZ6eBFcDO//D9hIHAGkpxfF6G95StGj
         n5wfN452qzuWcB38Rdo45WsK7ubLrgsawTQOrToa0p/Dqt3VxJVWo6D5fj+4Enx7ML2a
         DaUxR99Gk8dWFiqNW7Fap/Jaab3rNF9MCtyYpI71ErGPyI9CoxI9ByA2UXY1CjELwixa
         zpIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9LIN0GgImpNZdi6JPQAXaUPhgjJKGyLw8PfEnl6S1+x2UzLES9nwsU7OUCJy2CbCJvkaL+dKEH/PnAVwc2Dg=@vger.kernel.org, AJvYcCVqqBHq2yQ77lu0keFPaiK/ITBNF4DugJPdWUl3NMJNJTwSDRfqr8pN0wxT4GSs6EyDKtVxYx5lioUU4/8x@vger.kernel.org, AJvYcCXqubv9wbYHaDrZLrZWMX2EBOJO6ujV/3hIjk0mXAeCYfm6DZxPVPh5onzoXZyjmVM+LrPRUz+oxmNCA7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKeQQSANYppdfPuRnfqnit0dY/1xTpYyAM5egwunrxk3WmDZ1d
	B++LrT3ub4chE+1rNPI/262aR0BafkhnJjnRJN7hBdcRgzIWAjaBBaqQovPKJOO6cfHxeHGf5w2
	9K/jcbJaRKrcxmONieJlhNUtZ1VEUCtY=
X-Gm-Gg: ASbGncs3mA+IZoc7XG1Vkmp2TzWGihArybWrujvuTHjmBZRQT6wnVFN/RO2OMy84uZM
	YWXS2kSSwptouC17HwgQIIvMJmf7Pu9Ux07eya78Hv7eKI5vGkkHUFqcNW5TERuK184CnaEHb+H
	KXNw9rZkLn/FNi/61sR7rNrGkdIAJmUWCqxw2wtlpHPluFwTDxP+1m3ZkG2kAb884OKbWtsIy/Y
	DDvjbTw
X-Google-Smtp-Source: AGHT+IFFesL79nGBzljk+GNIBmaSr5Ti7vlS1NqrpA13NwKdp6CIpy50L5E7ZQVUz/gfEPq3WyBh66i9w8ESZh9NVSk=
X-Received: by 2002:a17:903:183:b0:242:fcfd:3f94 with SMTP id
 d9443c01a7336-2446da0fe10mr67054645ad.11.1755448277430; Sun, 17 Aug 2025
 09:31:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-kbuild-werror-v2-0-c01e596309d2@linutronix.de> <20250814-kbuild-werror-v2-6-c01e596309d2@linutronix.de>
In-Reply-To: <20250814-kbuild-werror-v2-6-c01e596309d2@linutronix.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 Aug 2025 18:31:06 +0200
X-Gm-Features: Ac12FXx8lU8m_BPaxFRjTbqDEK3t89iYkrpuhKf1HEFrkzIWKzMJ0u7O3KHo_Hw
Message-ID: <CANiq72m+_QK1L2bnjs-oB9fmoGb-1jK3JvOsuH3nsWaPM0ExNg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] kbuild: enable -Werror for hostprogs
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 12:15=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> The hostprog compilers and linkers do not share the regular compiler flag=
s,
> so they are not affected by CONFIG_WERROR or W=3De. As hostprogs are used
> during the bootstrap of the build, they can't depend on kconfig options.
>
> Enable -Werror unconditionally.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
>
> ---
> For testing in -next, as discussed in
> https://lore.kernel.org/lkml/20250812-kbuild-werror-v1-2-36c9ff653700@lin=
utronix.de/

The discussion was on patch 0, i.e. the next message in Lore's tree
view -- I would suggest adding it to the commit message for reference:

Link: https://lore.kernel.org/rust-for-linux/CANiq72k-PdSH2BNgbq=3DX+FhpyEE=
rifSCKfO5ObXz6bu9_J8+fA@mail.gmail.com/

Anyway, since Nathan already applied it, and I see a couple patches on
top, no big deal if it cannot be added.

Thanks!

Cheers,
Miguel

