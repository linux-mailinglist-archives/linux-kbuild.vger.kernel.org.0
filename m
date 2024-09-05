Return-Path: <linux-kbuild+bounces-3410-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8002596E454
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 22:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB6A81C23A97
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 20:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BEE193400;
	Thu,  5 Sep 2024 20:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8BZMmUB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8094C17839C;
	Thu,  5 Sep 2024 20:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725569221; cv=none; b=Y+PUn/O22EgD1gwkdPZ15Jhhoq46jSP8eS+1ydkMh5TWgyFgNpNeyFfBQ1NYQMRC4wnu8ox1PxzJylS34Dejmc+pwYkCCzqirZIt2RZ7ryK3kpLFxl18QHNESYN8kD9Qk/2noyF75+/QbdRkseCUvd0+CszKUlI+oftPQG4avFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725569221; c=relaxed/simple;
	bh=DKH0xshsIJo/ETksdiaF50SA60u4xZglDzBF5StYyLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/Er9iRc6anZhW1JC2PR5SpQgWmVNiYJJQtmyG2bkveldfn190oRxYBa/YWjXD9Luikveww8Up7RcaLJT6+NS03P31fvfpSUeEl9dlLGIA28Z/L3fZZa8S0Q57hNf0/J3R5VaQP+KH6pAhVfQgXXjbzusUpQnd4p+lnYtPRDDWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8BZMmUB; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71423533ebbso136571b3a.2;
        Thu, 05 Sep 2024 13:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725569220; x=1726174020; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKH0xshsIJo/ETksdiaF50SA60u4xZglDzBF5StYyLk=;
        b=g8BZMmUBAvPdpXre2u74ba4/mNq1IAhsQhc0kOHjzKa65xlEZsAX096FCqywPzPD/a
         T88Y5XIiMAO4ELeEn8sRcDVodoKTSfyXw1Zn0kb0rmOzsVyj7DNWcxoPfymtvYnff0e7
         WH42naMmNu3mdQkBY7T7UNaAhHRivQQEp0JRK4NbMIy1OTtznrw46mvYhevFJhL6FWKZ
         y+rdH8+jh8z5rZ7Z5LVa3b3OIkgB92Khp6U0MPiZD8j9tdM3P7JwexPV8GDBgTq4ACxA
         kA4U6KOcLpjb02ONiL9PfGMSALVyZ0WlZPgdgU26KiY7mIYRPfzn3OlietUB9MsG4Jb6
         puZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725569220; x=1726174020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKH0xshsIJo/ETksdiaF50SA60u4xZglDzBF5StYyLk=;
        b=IS57yLCWmtiCVd/p3hkSGv7dcWo4IQdFkg7NHzlDf+uBkrPZlcnEUCfFlnwcXjk1t4
         Qj1u7VrcEsFe7vuf+yQ75gt+rpP6JkxuvJJvfBCLBOH9XT1TOnABR6kMV/0WwRCYoR1A
         YS7RcvlQ0Ek6aOCttz9KR33Ma5ogtrC5j9Nv78AgPsDOXkhpNwvEBJhQ8zmS6d2kcw5Y
         ljNXTwiffHpb2Y9StA/0gyXK3cGQDcjlBKIbRyR4I7gti+ui8FbD0f5iqOZboik6aqnR
         IDMC1+gQ+wkvj+7mHKMe5LHFzXq4NmfxOYF8YChMSBl911ZCKYn8sdF+1IQmKz/bnCpb
         mFdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ+SIFyLtJ0HCWdsohlJ8wOO88WGNtbPrIybjvDwSciTn7d/xzSDL4k3w5xzjlaor3cl6HKVhafp/t8Wi+@vger.kernel.org, AJvYcCUabjO0EyTu/0INq5zSZKGQatlgeiR/xWzrwU0EihkeOUTibWcAlmX8AhGcuC66queGWhVB3cfVkU0WKdBKkBA=@vger.kernel.org, AJvYcCV7cXF/Ey8Cs/sO+efhOySO/8egnY9tq1gK6b4EmFcSXoRC25Cd2DoY1jaC+zuyfFERkJNKSH0AQlNTMCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlYZFA4QEvptEXIRqT7gsVszeoqozVMr24jktq2vV1rB2Ux36r
	AlBjsTj3p2kBT42fYQsvEP3vbOuzbMPjd+C+kd+8r8DPH2MqgIKnkqmwKKMpjAwi1oozAuoq9k/
	9m61mfwdUFlkjM38vs3yUHsNdsfg=
X-Google-Smtp-Source: AGHT+IFzXHgm+VyemU3aVNcQp6kBBtTnENwAdJ1aQ2Sebf5JxvLGKKgceH6BhhcJazgo2Ph4JaNZbZod5wjwomF4Arc=
X-Received: by 2002:a05:6a21:33aa:b0:1c0:f5fa:db13 with SMTP id
 adf61e73a8af0-1cf1d055c8dmr140864637.2.1725569219732; Thu, 05 Sep 2024
 13:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902165535.1101978-1-ojeda@kernel.org> <20240902165535.1101978-2-ojeda@kernel.org>
 <CAK7LNAR5Fz=qf1Srf=RJhGANQZDmiKkuHPeTbqyT+SEwjtDZWQ@mail.gmail.com>
In-Reply-To: <CAK7LNAR5Fz=qf1Srf=RJhGANQZDmiKkuHPeTbqyT+SEwjtDZWQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Sep 2024 22:46:47 +0200
Message-ID: <CANiq72m5EqCO7i5=fXpsETpHjexknvPVBWYcURZquQ12N_om7g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] kbuild: rust: add `CONFIG_RUSTC_VERSION`
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 3:08=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> This script does not print the name.
>
> Only the version.

Good catch -- fixed!

Cheers,
Miguel

