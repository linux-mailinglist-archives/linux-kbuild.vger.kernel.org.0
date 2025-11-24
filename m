Return-Path: <linux-kbuild+bounces-9823-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DEDC8189C
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 17:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1537F341D3C
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 16:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BDC314D28;
	Mon, 24 Nov 2025 16:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyWR6CqE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DDE314A63
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Nov 2025 16:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764001410; cv=none; b=WcPNiAOv/OyiAJZjSfaPsQ4RzMfF5BYXlg3n1v2iOAVSAm+OskgdTQJ1kcjhQ2MVgr+E87GI4d2TJmKXH51uKue7cfvlS8JUnPkgJ3jm3HfWX78DrLFh+f+2J7+ZWzJ9vPVnZIqt9cKxGBbdL+IC3LGiAoV56ycigs5C1z/hAj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764001410; c=relaxed/simple;
	bh=NzPDQKUXesN2tFTrxAWwSFcXk8odbWGEX8DQwzKHvdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=io6L0z38mYZQl8nIZH5d/CZUeeMQg3W4P0Pw30f8c9YlDs9mTrfSkHVflgcm8M+Yb4MflyX4+85tNan3Az/s9EXAZWVZmM5cDe6MhRbx0B9VvO2R/rvuj4azeZgHoEvE7nXZRljZZLYTzzukLila/4P0UC1pTvYdZPzYcFdfPJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyWR6CqE; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b9a5f4435adso397482a12.3
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Nov 2025 08:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764001408; x=1764606208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2J0sne9dK3n8ebmX/80sgM1htWpoO6vvwfgujnWbIg=;
        b=CyWR6CqEUBCtkiYYfaIyTWlg4VgvRVPKV/L+mK0Ilt6HFuFLMBsB0J4SuWZaCY2QBo
         SjfatR2pYwPX1g1BXvcH9e06shSsH9uVKqbpKj5UzgSpQAcrhsMr26O7D0j5gNHxvqB4
         agll/++b0KxxT70g1nfte+QeKWYceo0+wb4Okn6SR7VIuQfL6mlwpuXaKHbTDXqXxcXD
         cOUDGuonaHPHMkbjt2UBTnnFRXk58Aiy07k75QjJunIWLIUIonwxnJ3mCP/DjXO4Wf6D
         z4GgB3SuP/muF5AVkpFr+HZc//XslNqKk7dJIhtPcCl4mlLuCs4iJ5T7KNd6CmVPmfa4
         86+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764001408; x=1764606208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M2J0sne9dK3n8ebmX/80sgM1htWpoO6vvwfgujnWbIg=;
        b=R9qg+71c/m0w+LTIKJ3znMsC4DeI/HIUA53IcCaUItijAyULuLOCUO/z7S0zbJ7Re/
         7EajZmu7LkqpKU8oUVV+KiRiXahFj+YBb97FSyd2vOZ+5WMs9OobBO5G4LyE96tprNyZ
         /pytKMrwaRi7UThoXsT3jPmWyelIydGr8bfTbSCI0tIp/47e8t/6Rtb+NXuJcjUBYqXH
         hVfs6NcCSjCVIXGdBxp0hP73DVWv7UglQhWNuNeN+2mTBOHzdyohbmxM+lTakDdMnQnJ
         Vj7ENMC6mFDGRTlAgaonE1JSX2xL9+IOmQ03+2jSW4rThC92dVNZeC6jgPw7OMne3INt
         G/cA==
X-Forwarded-Encrypted: i=1; AJvYcCU64/6xfMJ2gaJFn5EvnQeEfhVLR9u0N1sk7dnlApLXwlurBbp0VDaFBJdB3AehdsCEdsPU9u/9X7nGIWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNA06mzBPmvcW52+aGcmNNkGTuvgAKg3gvSuVlc+QNIY9z1c3Q
	TYb+ZwmQ2XErGpAsYAM+qthP9cQO67RJqoMJvfywEgQUV6DAP7GLXh+13yuIFfiPQvdzEFSb4uw
	toJyiTnlxYejRskBquw4U8XkVLXfUjCQ=
X-Gm-Gg: ASbGncv96sG/GoqNqQc5f3HgIoGOCKhCLhyEDaiL/C8omufBBuTOWWHueQ4lv/K++RR
	QWttvRDgjalrznSq4kr1jBA57Ky7ebrYFVpL7ntpIugQiEnguakWVTXq5WGKIA49qfaHtaA9ApJ
	65Gf0qNhOs0mIgpfDs69PVdfot/Vq35CQhfi4D9HucTLBIJA4MI9pY048OG18GE2uEO5O8Y24th
	xzCaKFBDFFtpuW7OYRTC4aQgig1cf6l5C6fLY1q8mXOj53PFcWShhzyvI24Q1P+DjUUo2fzujGX
	9Gq9ZgzXE6dJoFE20wA/9zK3IWse4qNtwcHe41WhLFZ8+tZ4weH1UM/cch3MOp/QK08fRg73EvT
	cOvqlcl3UOBbaSA==
X-Google-Smtp-Source: AGHT+IGwXl0ZV6sCuJIMY3nmCYvEqmx2yNHsP6C5DZXOUJriOekXZR8ClIwnhdXq7nRGAKTyK7rmfByoSAzp7B5Pcj0=
X-Received: by 2002:a05:7300:dc93:b0:2a6:9dbf:bbe1 with SMTP id
 5a478bee46e88-2a719324a83mr7221018eec.3.1764001408335; Mon, 24 Nov 2025
 08:23:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124151837.2184382-1-ojeda@kernel.org>
In-Reply-To: <20251124151837.2184382-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 17:23:14 +0100
X-Gm-Features: AWmQ_bmjzzjuGyZbSwxV4iB0sa35jisCYH7BCVB9fd0FJ3BHVjVHicd2rDqz0Ns
Message-ID: <CANiq72mLMHF35UaML0RqiTOkVORr25W3Ug06uttYL_H4XCW=4w@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] `syn` support
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 4:19=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> This patch series introduces support for `syn` (and its dependencies):
>
>     Syn is a parsing library for parsing a stream of Rust tokens into a
>     syntax tree of Rust source code.
>
>     Currently this library is geared toward use in Rust procedural
>     macros, but contains some APIs that may be useful more generally.

Applied to `rust-next` -- thanks everyone!

I mostly sent this to show how it will look like and because I will
use the expanded cover letter as a merge commit to keep it around,
since it has now even more context, and it is a nice approach for a
long series like this.

Cheers,
Miguel

