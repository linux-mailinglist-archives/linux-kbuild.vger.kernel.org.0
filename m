Return-Path: <linux-kbuild+bounces-5761-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B738A36E4A
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 14:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D70BF171611
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 13:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05BFD1C701C;
	Sat, 15 Feb 2025 13:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8tNpDey"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1EB19DF41;
	Sat, 15 Feb 2025 13:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739624420; cv=none; b=BfZdIr8S5vBY5SPp1hybN81bKEUHwvRJ7HmZ4XT+RaD9S6D4geO4dd6pbfK3U2P3maYLAfnpMokVyv5ggOKrkA1k2N/R2YDP5ltT7SU1wWDN7EgPzhTPZFBf4Divo+JGpHBzy7vR5/YQtg8/mYtIOeJg1bfZA13J30NOSX+DqUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739624420; c=relaxed/simple;
	bh=w0pvTueIzTQegjN1z53/vVeHmRIdv6Lu6iiqdN/PLW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAeH6GT10lJr/cDaQGtGA4YgefIT8dk0bhMk1HPcPhD0ASHDRSuku2hBOCg0j62VTPwY+iWvMEesJhRKvBi/IM20DVz1OMcE1LlCd2MisZAyu0H3whOvgLZLoxpZKWPFA5pjeuqByr2owak4mZEvd/0THbCasvvC8FIoLorr30c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8tNpDey; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4403EC4CEDF;
	Sat, 15 Feb 2025 13:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739624420;
	bh=w0pvTueIzTQegjN1z53/vVeHmRIdv6Lu6iiqdN/PLW0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j8tNpDeyRwGsXOm7OszB7vHJKZvtXlN83ND/q4OhnEPQhvv5brox20QVx7nAlntVg
	 dMHSA/+eUrexzikHpby6abWi8lv/3WeVx3yUSknl4BVj/LWDlAny4fqAnCXYZDa+F3
	 PEO9l6vdf07wBIYH0owe105+hcE9SCZL1mC+QLmU4QRaMAfqOkBAjxmqvRJ9YucLcl
	 ur/NRs8vE2sr3RFW0N7ad0G5gz+SKxCaUHnOunJRUeSut3VblM6gqaL7q1ZPl9rFIR
	 F0+hnwyVrop03fxTUW+qzeE+D8pam2xcRHPRrajEhTTrYi61hh+dQ2+QC+1Dj9truR
	 /gOSpgpoBYLzw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-307c13298eeso29486661fa.0;
        Sat, 15 Feb 2025 05:00:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUe4fjQVkVB1UXPhreH2+pcSGlr47L3dqhqiaR32r2nlzOuEo+v/CG9c9nDtNDm4ZzZx5yQeWO4B6/ngpMuWb4=@vger.kernel.org, AJvYcCVQLtVjzpP3fc5hqHH4arC3uPhTm+PboXMzFVxSq0AkWXyQ1mGu7DydIhRqxMpcpws2SY3HMn8UOKWb7xbh@vger.kernel.org, AJvYcCVw2yyaAMK2eXgN+w8WnGPWbJmzi94V5OUkNNdpO9esNQfoGKXJ7RQHllG2a3uZGmkyFnbQjAaa7FT4tAc=@vger.kernel.org, AJvYcCXUEZ+WthbUFX+gHHP6sj72XpIl5ksrUJXNHxthrS5iK39SLQoZgyEzUNP+8FxbRD4Wu2W+ulWPaKmBuCp22Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9dFMoXo0/ymaU3pZLzuL2YNCYUTnQTZRpOgMnqlqO49/3EO8N
	7Tq0ZRAVe4JjhCLFZGO8QWHlbod6mDHKR26ww1vPqTM1LTGQGUaGnWcJifmtU/bElw78i5f9onK
	eJymLVEnlJwahvnvzt/kACvxM8k0=
X-Google-Smtp-Source: AGHT+IFSUPXvnmrMQIyQbKKEJMl6/WzRVPKaodRlZzvePIrXQzTw7tqA3FMC13U3PDsUYyGy56BeFSxbu0i7HoVQkbY=
X-Received: by 2002:a2e:a3d2:0:b0:308:f53a:ed31 with SMTP id
 38308e7fff4ca-309288b1b15mr8653751fa.3.1739624418975; Sat, 15 Feb 2025
 05:00:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203212631.565818-2-samitolvanen@google.com>
In-Reply-To: <20250203212631.565818-2-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Feb 2025 21:59:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNARwZ4YO4=w5ESenwNrEiW+_qV7HYNO0VgrWRrog1TSS-A@mail.gmail.com>
X-Gm-Features: AWEUYZn5I6jeoZtUtSgKhQecrGLZl5Br1Rb7Etl05VSFZmf8WVKA1X0KT6WJmoI
Message-ID: <CAK7LNARwZ4YO4=w5ESenwNrEiW+_qV7HYNO0VgrWRrog1TSS-A@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: Add a separate pass to resolve FQNs
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 6:26=E2=80=AFAM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> Using dwarf_getscopes_die to resolve fully-qualified names turns out to
> be rather slow, and also results in duplicate scopes being processed,
> which doesn't help. Simply adding an extra pass to resolve names for all
> DIEs before processing exports is noticeably faster.


Applied to linux-kbuild. Thanks!

--=20
Best Regards
Masahiro Yamada

