Return-Path: <linux-kbuild+bounces-5930-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 148D0A48324
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 16:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EFE716A916
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 15:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A07926B2D5;
	Thu, 27 Feb 2025 15:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ka5az05Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66C126B2C3;
	Thu, 27 Feb 2025 15:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740670678; cv=none; b=u+1ri6uR+sjqUvyhLYGD3AXTfC4sWFm056nDGI9GtDIjyXMxTmAg/ass0m0Rfnlu/1LuO2yuza4PLpo/5903FRkMo20XfyOzq+5QIbDuH++mEVZeLAF7U+eLkyUrfqc9R4uJ0oCKTgq9vKItl4SAZyFb6ga4g6DR2GRO4gcA3nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740670678; c=relaxed/simple;
	bh=FbI6XZmNMRmLQmxNqXlcyr0GifAP8we4pu9zfnC56mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KfZ8Pd0+8jdL8QupWSYL9xj7QwNMrAjrfnggzS1cUrXLK2igZmIAEV4n1cj2H0o9vBhpDjK6P+tyxa1DYHxZ0hjDO+F6IcI4Iz411mwAb6W50DOrTsqo5qPZY/uf/zKv5xvjLfmOnFx9SMvSHbRmjgxbJsSs/JK1pqLfdb5Nmss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ka5az05Q; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f74e6c6cbcso287882a91.2;
        Thu, 27 Feb 2025 07:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740670676; x=1741275476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbI6XZmNMRmLQmxNqXlcyr0GifAP8we4pu9zfnC56mY=;
        b=Ka5az05Q5WHv/y3o5sR7enP2U+ysaomUu3YwrFsYpirVcCW7slscZEtadqXXdvvAVG
         egukBZvW6A+bt25hhzfNQ9UaAqnOjyGRjahRbv1xbozxEuE1ZzEAwo5h3TvqVHotAt7x
         UT5G2p08kNwtbx4tQXOF81qkbbatTIkyQAmDt4V7wHVrp6gZzzcJy5fRJvJjhgZAqLKy
         DNy7layEZtiRFcGBDjcntCH8gjhsvcWmGorXJQvTF7+iqxiD+mmERxOubqBeZH/AVzbf
         RCWB57h97tcPsye3BuvUTsVeA+IcFHtAXz7iM916Q1o4MjZ1ak45QiQfeISbUC34nBLe
         vdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740670676; x=1741275476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbI6XZmNMRmLQmxNqXlcyr0GifAP8we4pu9zfnC56mY=;
        b=vv1tyBbfeYz/CILbl12KerTodsMnXlojgC7XOt+mpRHDb2J/U4yKW9bJnuTJP83Z64
         oB4hFqafXSWvt58X7lPLPhdMDzbvDgsaGANT2cY2gACh0+m7CxBWCFECYwF4ZWOqwn/D
         qa+2CTAqcsnutXXpviQ1ZwHpXZZ2KZ9f1NOX4VNeN58YLt/rES7sWEkiwcQBCr/Q7NQA
         11x7ClTCzpzQIc/RLcDyl9PW6QO+vxYx7V2Jb9utYiyCm26sFbxEDklNQEFghkkp95fa
         RJURGzNyRoaA+HfI/pnIPfHl1C8e7jHV1UBG+L411MwpxjUFXePzVKpL4O1xBaLrjcJN
         xBJg==
X-Forwarded-Encrypted: i=1; AJvYcCVR5+r8hKVK9AWWz6x1E6Jk3V6fqfdz+Yv9miR+RlPNBax+DBMxyUfZ0O+IugV03wdcKwT6zRXvn7oury4HttU=@vger.kernel.org, AJvYcCWWwo/WZ/bzZg0ItISgc6t/TBtLlWK7LchlL4lqGtJeLhyCmDnhRExySPgpBetivTgysRAiFZxyAFl5TC6Keg==@vger.kernel.org, AJvYcCX16IRBGKzi874mfcYY14ngiMLeoo6M944OqWNxoppdhmaunBdotPlWjcEiXiPcGQJl65ODlH34k5G5Mzc=@vger.kernel.org, AJvYcCXTYRBncXriAl/IIgVMUHbD8H5wOxpE8xERSx+kq008hlIwLck7vZqov1VrbpP//9JwMnov9DiQtRE/tTmz@vger.kernel.org
X-Gm-Message-State: AOJu0YyDl0sZOEy+bRA1lVEcCvDj1RxdU+ZtbexMWkod6WC5oLmtpK1W
	6WfQfI+2VfixrJ7r990Lu9y4pUU+CE2rw+NET6A23gxpR5q7N0nY3JDoYFVrzZ5EyJBYbibfffM
	w44+Of2VVNiRbwXUoTEi1Up4tM9Y=
X-Gm-Gg: ASbGnctU9DvIhXP9xAzhyCdJ+eecj9XoY0pMvgLUn01MlnlBYcV9mgBZfhvR4pJcUc2
	t2fX+2+FgXw2ttzJppKfjZMU96pX5Xu47zj14rHljz9ahr7zwqSD0RwjGJc9LKIYYgaVQarMtG8
	eYScp0Wao=
X-Google-Smtp-Source: AGHT+IFCp5/Johhe2ic0tzVPLeFfBjhEEZjhG+t4AmfCggQIZO4T482Rzr+aYfzr7U9P8DMD5Hr3WkTILZL60MYGs0I=
X-Received: by 2002:a17:90b:4c04:b0:2ee:6db1:21dc with SMTP id
 98e67ed59e1d1-2fce76a2781mr16775055a91.1.1740670676039; Thu, 27 Feb 2025
 07:37:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <JKqjFnoTeEbURcTQ5PpmUZWDS2VMEt0eZl68dWkgk3e8ROFpb2eTWH2mStKkkXJw__Ql5DdYvIR9I7qYks-lag==@protonmail.internalid>
 <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org> <87ldtv1t1c.fsf@kernel.org>
 <0d9e596a-5316-4e00-862b-fd77552ae4b5@suse.com> <CANiq72nBK=HZ=ZL9bYhB8Z+U5QK3xmsQesO9axf_Fz0_1mWREA@mail.gmail.com>
 <aa7c1589-7c36-4721-b815-0ab065130b83@suse.com>
In-Reply-To: <aa7c1589-7c36-4721-b815-0ab065130b83@suse.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 27 Feb 2025 16:37:43 +0100
X-Gm-Features: AQ5f1JqJrZyt2SAQp7x5qAkhGbToCTmMT4wPI7X7Mr8mkwa-QVAILRH9jjOpuh4
Message-ID: <CANiq72mW94Y-bsJFMHqF8fbXhvAizEn7-NnxawTW+5brbxJHBg@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] rust: extend `module!` macro with integer
 parameter support
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@samsung.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Adam Bratschi-Kaye <ark.email@gmail.com>, 
	linux-kbuild@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 3:55=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> From what I can see in this series, the bindings required adding
> a number of generic functions to the Rust support code and also most
> discussion revolved around that. I'm worried this might be the case also
> for foreseeable future updates, until more building blocks are in place.
> It then makes me think most changes to this code will need to go through
> the Rust tree for now.

Those would normally go through the Rust tree, yeah. Since we don't
have many users yet, and we avoid adding dead code in general, things
are fairly barebones.

If you prefer, we can take the non-module related dependencies through
the Rust tree this cycle, and then you can pick the modules parts in
the next one.

> On the other hand, if the changes are reasonably limited to mostly
> rust/kernel/module_param.rs and rust/macros/module.rs, then yes, I'd say
> it should be ok to take the patches through the modules tree.

Yeah, that should be the case. Worst case, we can do the delay-a-cycle
thing, or if urgent create a small branch, etc.

Cheers,
Miguel

