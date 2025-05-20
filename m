Return-Path: <linux-kbuild+bounces-7181-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE70DABE3C9
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 21:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26B173B9A3D
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 19:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809DD25B69D;
	Tue, 20 May 2025 19:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="con0xA/k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDE524C692;
	Tue, 20 May 2025 19:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747769833; cv=none; b=eScNpyA0l19oUbscCs6MKSQBvRgqvGcLQRMTDlI98OcHovphUuPr5Q8l3Xos092mtXsxxbsBl0Tb6Tsax079CPglgdi32e1KW9ZYhX+Pq/L1+0LOm8+zobtB+2/E8NMWzr8ykJ0kaOevgEgZaf0hz0QZM6HeBS5LAQy1qCU1rLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747769833; c=relaxed/simple;
	bh=yJmrJvk+batnwnKet1/z0D18l948QTmCnCbwr2N/m5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uhleKY+cyiWnMKUft1dpJv/XbKIT8PgOPwVKpdRn452kjCsl7LkBpxefyaVM6Z/1URVl1zddIyj4Ta6b6r2FzeY5o5tIe5xZzoQ+m1WvtfnOif13HTYQIeHiYi9087C45chphCXUkyrhFlDr36NnkPwAKBNST4CWq+X/+VvKevQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=con0xA/k; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-231c88cc984so6544105ad.1;
        Tue, 20 May 2025 12:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747769831; x=1748374631; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJmrJvk+batnwnKet1/z0D18l948QTmCnCbwr2N/m5I=;
        b=con0xA/kWTW/xK0tg040qkLzknxgv8KC85yzKgZ0hvHhaKduUPmF86SOjae/CE3RR8
         psKpvvSsE8Zy5BKQBzy5TpbEeYOLcFk58s+HThhsq31t5KffC2wmMeSSkNl7IUNtMjLh
         puvUk6YDDg4CeWT8fD4u/63aZ1OIH2naYvTVnzXYYK2ReNArm2VPqhfVUkG5N8VquhHG
         Gwz7bJKif0lUhz1puLougTi8d2xYTT2GlhZ9MbSYf/rW95T24vM+j+DP4L8wp002Rdxx
         AhVWCUhoZx0GLr+uwAsEryLCRjGtyz2ReIl/G7jWH5DxZm9CsiaqE2UHV5IBnkezYw7f
         7NUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747769831; x=1748374631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJmrJvk+batnwnKet1/z0D18l948QTmCnCbwr2N/m5I=;
        b=oowsOODQP+8zKYXMJh/LViE8MORdKTvWh+trT52xO65YhII/P0OO1G8mehSnZ/3QvC
         8rydxQfzeBuUyrnlZVLZVMPYU6P8dlQmE+c0oXNTHrjaAl73A+K/oVV9NhW8LdNeRkio
         60bsRaaTGcdgBKN21lsPkwRDkXav06phcs3C55eRAQJDo5eUPf5kHqXRDT6GQxgTiZlA
         HJuAsltBZTLCjKp4+B9ALRseCIbYMohBYUxv5ChxKkSR+8FvPZL2fQ4q89sodgtLtsRA
         0sPr8I9LXq3a6zWmYRcU+Xmo0R6kvkUim6/BRrLZotQg+foF1fe6eXxPh9I5ZzqKAWA1
         ru8A==
X-Forwarded-Encrypted: i=1; AJvYcCU1H0gc+KIyb/h0cIjM9R6U/MGJqkPvikQkaQO0BedM9Jk0DC4neY2RRy1SZQYn8GgA9DR8/8Jfq90ybXX3@vger.kernel.org, AJvYcCU3nUpYi0Ynk5H4NRexqZDFPP5WYXnzv1xse3wTuTA7UTK3C3ZXaV6XCH4aG1l9NIr3sAuSh+PDJUEXKn4=@vger.kernel.org, AJvYcCV/wpMYiUWdGkSSKTkufQJI94KSbJ9/hIU/wnH54s9iywr87EoX8zRUK201GRREI50vnJdbY0AU2qWhifrf3wY=@vger.kernel.org, AJvYcCV1tyAPx7O1a/+5n9s2lb+WYUh2dqaQ47gbcvrJoN4ix63Ms0tD/Ne9fLeT8pg+IiB1oPQJEHjt@vger.kernel.org
X-Gm-Message-State: AOJu0YyfNT85DJds+GEFNWXSi4vH0KoqjDucVlj69BXBX1CQ0v6c1TzI
	RizhYGLgWjbWAEsueQSD1cI0XNzmIuyK49TJ4RvDBaSCTE6bunpiwCvUQiWN0WP0lntgC7mlKIJ
	JME3k02z8Bbo8whDBUYYuuRXYsfeA9Qw=
X-Gm-Gg: ASbGncsEvV+7BG0idjRWjVr1MZTbgsqCn4JMT1qtyPLDkcsx+iAtWz9VM+ikWmuDJ4I
	bnfqZP4fcaOipDobIqMW0Iu2vPx0wdu36sd3JiHLCIKUAVMsjIkDmqAq5Du/YqfCiWIgLkZzYOp
	tW+bVQrKYak/twFvyJiVCiHb7LB4l+Hbav
X-Google-Smtp-Source: AGHT+IHRYWQO+o6MeHbMj6f06qEP8DvM7w1Xe2r2Fhyflg1I5VaCbhW3BSNMk/qJJgj1bw9CC+AcMMksSMpaZZLrGkA=
X-Received: by 2002:a17:903:1aa7:b0:224:1212:7da1 with SMTP id
 d9443c01a7336-231d454c962mr86733025ad.13.1747769831293; Tue, 20 May 2025
 12:37:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520192034.889415-1-ojeda@kernel.org> <CAJ-ks9=4DJdbUBiy_45wWPviOs48NEK1DmeqWnDaFSpkoda_GQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9=4DJdbUBiy_45wWPviOs48NEK1DmeqWnDaFSpkoda_GQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 May 2025 21:36:57 +0200
X-Gm-Features: AX0GCFv7GwY_uuzeDx4i5uB4OAE_8m-4VXTRgK6xXtbANDNefPefyVLnTkVFpw0
Message-ID: <CANiq72mZafMsLOnLHGTsn_2yfYy4xf=OrTVHR68EqAx+6OBdww@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: rebuild if `.clippy.toml` changes
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 9:24=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> It is possible to do this only if CLIPPY=3D1?

I kept it simple on purpose, since we will not save much (changing
`.clippy.toml` is quite rare to begin with), but I can add a
conditional (likely in a variable). Not sure if it is worth it.

Cheers,
Miguel

