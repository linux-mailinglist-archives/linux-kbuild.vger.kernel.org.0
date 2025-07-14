Return-Path: <linux-kbuild+bounces-8010-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 590A9B04C73
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Jul 2025 01:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BECE4A36E1
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jul 2025 23:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA644281358;
	Mon, 14 Jul 2025 23:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBb67QNU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F192281513;
	Mon, 14 Jul 2025 23:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752536336; cv=none; b=U82B8Z9bHBvCaOOodI871DrxHiI3uPDYQLx6ST4ZcP8v/fBthC9yuTmslFj/Txuw2HolZfbZTmAo9esWskVHmsezIsf1IE1E27/EImRiA3yswZy/eBXwpT/q2ePJEV/98XAzrNlpbxxEtpZuRS0rA8eMDiIobQmz9KnIjKw1Et8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752536336; c=relaxed/simple;
	bh=1mQSQ1q5Ef2ZaE9QRvi6jo6G/wDdTRQ+ABIy3j1J+So=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhjY+R/hxQ5cOYEanmFG8gUtRXHgDBN1cntZuv4Z/3pA9toTCRMp3gBXK8iF/tdsYtJxEyfVzumoUqjZAEK7mWnY4+O1ZrImirOQZXz/rVCDAfRm01Oz14Nq/r1aTJjvj5CFYpPqCwSTI/46h5FVUp1TWOCkc0xpTzFBVojB/o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBb67QNU; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313dc7be67aso876552a91.0;
        Mon, 14 Jul 2025 16:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752536334; x=1753141134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mQSQ1q5Ef2ZaE9QRvi6jo6G/wDdTRQ+ABIy3j1J+So=;
        b=QBb67QNUtGUHyWlh6s9LXlhGz8hdFPH8dXPgBuvxLdL2nMZyRiFa4ygcEMkfVqrJ6l
         UVrPIIH1YOqHAtTHkUn6FlRZe+Lzmd6c/IvJFsHjjsfm1ft7Esb9PL+AxrJv45E9GrKm
         rKjWrM9EjGobQw5A5C5WTpVjLQNJbgFBVdb9cKIIBqLypTXMNkvVboiD8MDUmiQYL5pR
         cCuPnfK0dGiRj9PBllPVQ23BTZwiCaiAq/rD8Kgum/PPS4Wmou5bkabm2luZQEOBoAnr
         wHbAzlxHmpcbnr7+UNidNB8w0v4cMuuSXVyzlTcY324ZkelVswf3qHPi1K5rIPw5vGad
         +fWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752536334; x=1753141134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mQSQ1q5Ef2ZaE9QRvi6jo6G/wDdTRQ+ABIy3j1J+So=;
        b=vSscLNaF2rukA1F5K9nGNooGSgL1opYHd0SnvY4D95vO2au0ztQA+AIeqZqqpb2eCH
         dVoUMN4F+BuqyiVCDyUQZxnZxoUOX6FLdkM/ZiWu8xi+Q1kuSnWL+3Jr/awf+NQ7OpBQ
         88wPKAMnA5rJrRgV17Yy3NIdNj/R+Jpk0YCgq2efn/F2XoLKXtK2T4VYuoCpGDIad8IG
         cxxm6Vz8TGfQkb16jIWpVbOSk/sCaimUky3AqEzRlMCDUYOAcvRsdJtG7SWkkTttVQkP
         p1O6TnwKGjyh4kbcsGAS5d91m2gxiBQpP5QILjbvs4DuYYHMumGWh5yfyek2DNVpMi1x
         k72w==
X-Forwarded-Encrypted: i=1; AJvYcCV9wZYqw8esX2XOVX+60wj/fT3mBH3zvR36wkW09SYvqxhzkkcZWFPUoOXwPaK0z0eVniwpBp9tVQ8N5oll@vger.kernel.org, AJvYcCXKbkf+0WFRP3Q0sk2cO6pUmn4/3V7zz5QBTg/JJxivOCAs5UPB3j9aOTe3+OibjDTrHCslaKZJyggVibw=@vger.kernel.org, AJvYcCXhDk1ZVxGNBMMLCJQEXHlfVl1pY6lRF9h5fNu9dAdMsWsTfQCGCHNrL+4TcNsV2kUdKVuXUqJRT9n3iUvEiug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7npE/Pac07EmF/JyHa/jWLG/ejeh1FwNTpKNU3+xeyr+Qlhox
	aQuqYPhPXewjUwyafqYRsHd7//+9CdeVkp1vDimaDVkw6MBFaJf4p5rzFaz77553dzeenjnqJRt
	Cha3uE7l27v7ylJOYx8m3vy1p7+qKKe4=
X-Gm-Gg: ASbGnctfhozNBwIUbZnicEpcZm9O02T7+s1XvMcUY0MZq6oMhJNRET5pohNjCyK4AUo
	1jFG15VscD9laenDRvb/k6/SrPp9HI2DWHuqs2OuzKuzBAC7Y/hrmcJg66RGrsAk9jba/yaCD/y
	y/LnRcqSkdCGJBtchDVHaaVAGeGIz4SV5JGOoLEZHXECCs6thPet/4CdWMw4Wp+A65KxJTNa8nb
	f1BQDuj
X-Google-Smtp-Source: AGHT+IEH8rVzJYuZjkNiHEvXpl/aQ5FUz43PcZxZ03wCn/Hv7JuV3hihohjdpqQZU304hqy1Qoy6+GEIlWqZTE7QeJI=
X-Received: by 2002:a17:90b:5408:b0:312:1d2d:18f8 with SMTP id
 98e67ed59e1d1-31c4cd5c254mr8297687a91.7.1752536334389; Mon, 14 Jul 2025
 16:38:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250712160103.1244945-1-ojeda@kernel.org>
In-Reply-To: <20250712160103.1244945-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Jul 2025 01:38:42 +0200
X-Gm-Features: Ac12FXxPmB-I9ermNetzFaG2Dns6GMapGpZ1IzJb2A4EEMsWtd0tM9lQI-XZ03g
Message-ID: <CANiq72nLfpO3neWTW-9mavZW+raDk+udU_zDmKbigTCiYZyU8g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Rust fixes for the upcoming 1.89 release
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 12, 2025 at 6:01=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> A couple fixes for the upcoming 1.89.0 release, currently in beta.
>
> With this, current nightly (1.90) gets also clean.

Applied to `rust-fixes` -- thanks everyone!

I am applying these now so that v6.16 is fine by the time the compiler
releases, giving how their release weeks will likely line up.

(Added Acked-by from Bj=C3=B6rn to the second patch he gave me after
discussing it in private -- thanks!)

Cheers,
Miguel

