Return-Path: <linux-kbuild+bounces-5981-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A57EEA54B4B
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Mar 2025 13:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED5361896F75
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Mar 2025 12:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EAE208989;
	Thu,  6 Mar 2025 12:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gywzQ7Bz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0640F1F03D2;
	Thu,  6 Mar 2025 12:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741265842; cv=none; b=V3dl8kzQhFnUQbCiXonoDQrQSZn/RKvP76SIYh1mmC+sIyPRhVo63GSuloZPQ3+zl6wGtBKa9dXPpUqdkwSrYGjJsQ8LfIoay19XjF9SWXtpMljLAhXzPCATmC1erQf035unI2D2DaGXc2OCHxFZooqxcWtOqDe9YmqA4Q9HZkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741265842; c=relaxed/simple;
	bh=E39Ml7fCBZbxfVHzjpdOttpEvi9Y8jkd/560+rZTYD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KOJH+SfDGw6p3gPPLz5Ump5nrd7KpmzZfvNsf5i7QvucZMqKnRQf+iMWl5reeSCCcwQoHZev8xWry52d3jD9mHn0nh70h0eI/5M807+N8TOW6BYUZYyg11lXvYIO50i/ghtoOfrBT91ZWHxgA49713CXG2gppfrrHZn+EvOUQe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gywzQ7Bz; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff66327419so152475a91.1;
        Thu, 06 Mar 2025 04:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741265840; x=1741870640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E39Ml7fCBZbxfVHzjpdOttpEvi9Y8jkd/560+rZTYD0=;
        b=gywzQ7BzXEG0y+Pl+I6agqEzZ0A/mXjA2yG34acdZHs0NNiB3mNzZwX295QzoteXFl
         OzVKF0qaVYwl/NLscX9Pecq6aIGlBtnyAwrKyZEx+5EUgCEDNrwmmvUUFLuIknqmsUnI
         2a/V/tmrYv35XcyFtaNInXN8fI73fekwJpMqHFIFd2Z4ihPa8groTkilQLhnAEOWtf9g
         +Y7assirUvu83RFfuxv7+MqDxB89luGx81LsVFrUZIGppPqySa9gf6uuJh/NuOExxfqc
         VoGD9/Frxw0+8q6EQLfdQ7ypQdiXGPZTewIJ9iDm7aR5daP3DJB7yV2Q1tn+wo4by6va
         eeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741265840; x=1741870640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E39Ml7fCBZbxfVHzjpdOttpEvi9Y8jkd/560+rZTYD0=;
        b=PCCQsIbr9pruWmh8qDEe75wxVIXKqLF8anDgMlklmNQ9JC2qA7PlR/3HnkKq7ZCat1
         OKxAB7OVJcOjZuU8oq0St2Ia9PSUt0ult6fJo2oX0f16P49/ARm5IJ00UAkochwywY2n
         PjFvXNMGoRcYk14Vs49vrfc46Zb4fVqPTJRp/VTPpq3LupsSd5OrrskrE6V2pa0ewFUF
         eCL8fAVXodr6l2mnxRlw77KfvZhX9WdySfgCv422HpwlsECaL8v5S2CSnpwkD4PpFjxn
         wVef0oMDvjNx946ySlk+Yss7lqzkGV6Y0KglBmDHoVASXbLJs1SXtv+5d7dkPo+HepF0
         6lMA==
X-Forwarded-Encrypted: i=1; AJvYcCUbByUnaZ48JWTZyCCb8xtDsApHgT3dgJh7Y2aVc5xw9+q2sDSQmbib3q78okE5Aw5gG3B5jOsw6oU=@vger.kernel.org, AJvYcCVLZNoFVjOaXmaBZcBOB9nZnyASbmPMiKsd17g0XjAOER6N1Qk1n6HKV98vkYac+r71gJ4+Q3twcTcv9vIomJM=@vger.kernel.org, AJvYcCVrZSQE0iZjw4Hg3Yv8XH5ucM2laQPKszoVijBsucuhLCRAJiJsl8BKpN4VIaLNMzXpCOKksLVyh4OBM3b5@vger.kernel.org, AJvYcCWCqYdH5C1JfSQokbuIRguEPrEozEFjlhPBfi+qegr1vjP3wVV4MfgKpxUKulz0llp3HPgeUFVfuwyQVC3b@vger.kernel.org
X-Gm-Message-State: AOJu0YwqG/igcZkRGVlMp/Ueq+aMvhFodV2I7TjQl7ERMc7Y8pU0k/64
	ET6OxgAk4aUgFPAtHZkwAKzre7ndNhXtJ++QtH7NErmm0hzwQ+yJzR2wc4n5sqwtxsIS2ZZRrFP
	AkLn07Kt9/hH8fuYjrQ2I9yZQL1g=
X-Gm-Gg: ASbGncsaWxGrf3d7qAdHSBfey6PwfPJsNLk1JNh2K22+6axHMLsoMTgLn7mCd2ru+Jb
	5JNCDVDDue9dcWVT0SjfjIV7Xg8sqAudK/8DI7K9Ybbwt2m1jLssYcZ2kPt+f+Zc8ZMeVnMlxxu
	OYtfKMZYhMA7NwrisdJVf0ddiPng==
X-Google-Smtp-Source: AGHT+IEWKk04PIz7Wk8c0F5vZKKvySTmpJETnfri4bCYCQcstfnihMhMTAiUwNPxtpeY7tThxygpdKPz6oh1oX3Y1Zk=
X-Received: by 2002:a17:90b:17d0:b0:2fb:f9de:9497 with SMTP id
 98e67ed59e1d1-2ff498223fdmr4702572a91.5.1741265840262; Thu, 06 Mar 2025
 04:57:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210164245.282886-1-ojeda@kernel.org> <CAK7LNAQBFX5q6yyKBJoxMoD5d9SwdKm0c23J4+LpjwA1eh=bZw@mail.gmail.com>
 <CANiq72n=95jgJs17NFAkit5uzxqtO9xij9Um3ybd_RiMCpFrDQ@mail.gmail.com> <CAK7LNAQC5Q5EQjuvMEWS5NAs-pixj3b--rkCHZ=xGQDTHqBBFQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQC5Q5EQjuvMEWS5NAs-pixj3b--rkCHZ=xGQDTHqBBFQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Mar 2025 13:57:06 +0100
X-Gm-Features: AQ5f1JozzC7HXKLXrrD94nPS6o7fBCrwM6b7SXP64UvI5vEbi8ijBc_ec378rj0
Message-ID: <CANiq72nYUcGDmDG9Sx1AqgyXfkUWA4B5M3d5PexVfN7JB58Ryg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add rustc-min-version support function
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 12:37=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> This has not been picked up by any one in linux-next.

Yeah, I didn't start yet, sorry.

> I applied this to linux-kbuild now. Thanks.

Thanks!

Cheers,
Miguel

