Return-Path: <linux-kbuild+bounces-13524-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pj/qE+8UH2rhfAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13524-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:37:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E47630C4A
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:37:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FZwYpsYL;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13524-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13524-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 721603046739
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 17:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154B83EAC8D;
	Tue,  2 Jun 2026 17:35:46 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56093FC5BD
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jun 2026 17:35:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421746; cv=pass; b=UTJDdLujTfNcdjaoZmBVXmD2VUUCZrC0HQeAesF4MdxjmVghrJTXewZ6My3WjEmEQ/Sx2nij3rMbeTsob/CrVdVSlUHS4dEbnZ9DWDjDifc5c6hLnRrYykDBpD8OpJaU2AT8RdIrOiNdxflVGONjyeU9zhFQgJNaCAUe6DDMsGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421746; c=relaxed/simple;
	bh=sy8Vtb9aRVtEoGFrmpT8g6o2EfIr4b6IYQ0R9FDVQbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoLKJJBw3SshMJkHwpgsoOd5ujZpCTdkZGGFufhw5cfnbt2QlcnHgS+AwsQWL5Rkp4QOe4cP3kL2dNvBEla2JFbYbggs71+PsyflX0wOhlkFvBH1FGL+GHZjfRSBiC712k8fqbB9UvjiEaFblxMtQ61ksp2yodiEYMk6mhjKgaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZwYpsYL; arc=pass smtp.client-ip=74.125.82.45
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-137dd497007so243889c88.1
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jun 2026 10:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780421744; cv=none;
        d=google.com; s=arc-20240605;
        b=djn8RG19SDtSdvVAHZOo8uod23pvo1/4Iox1CZVaxMrANbwJBcG1HYOkbY7uqJdqew
         ZH33oJgEnViI2KnvWF5lU+xvfHOwim01fCd6KxgqQYC1P1q7X8whwbUggEg4DkvkS/oN
         xwZyhr4N94pt/GRRqGzal+jivX9JJDNJbIbZHueztKP5MiOE8dibIFO4X6loUNkXXfRa
         qS2xMSjjXAqXQoxnQDtjLcb48yQR16zw7Di05H/oTz9V3sV57i5+e4DddTsf4uG2kX6Z
         NGUHVh5p+GwhXGhlySjDsCay1Sq2wBNG7lOwWXqlctFmi5AKbW+rs9j+dhh2QBZJWXcg
         WkeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sy8Vtb9aRVtEoGFrmpT8g6o2EfIr4b6IYQ0R9FDVQbI=;
        fh=617YoHZe4Ryh0gyhEd0ZP/Bkwnt6g4uF1CIUg+pyZf8=;
        b=cE8HS/h1uvAIhUcrj7GRpw+bTv0yL7WkbuTr4flXq3H+RYrMrG9h2sbvVslo2y33M/
         RqkFWZgtmh0HajSJnKTfU9STkSLdCSyqhT+4UKEpp1nftQ691eX5AAjR8YZiOy17qXMB
         TaN9Bp8pEZmr3u44UE9By68WHxcGXuR+CqkrKhWVVoDXIjuijbZI2Y2vE7IBdtc8lZz6
         vlTqSid7iunZoF8OtYP/5wmcl4PTNbSm9GIZEvhUtiy/yv4E8eeo+GaiUBfa0ranVZyM
         UqJheQyVxKswN9dxXQB53kTa5sCU0yG/IQNpIwzbrAyW2BZLyxmwq+fo8VBzADy2oNzN
         gBgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780421744; x=1781026544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sy8Vtb9aRVtEoGFrmpT8g6o2EfIr4b6IYQ0R9FDVQbI=;
        b=FZwYpsYL7iVbPnmJJBP3q6eazDg+j9/2vLbMg9frXVTJ9DPwGOz4gzHxOjNuMlNh3d
         xav4EGXetlpKQsxH5ktUuc1uAECfgPKd0IbFoOmsaDAuM11tOnS7Pt6GnvrFOlMQnGiu
         8gPfCnZb1Y1Xa+DXp0S2kI66DE8V7jYfs3/LD35oZEZ5EqH1KpsFEnRENrgtUTQwPOcB
         NxPgnPtbyfN4RJejISuKyDc9OEl4WLDI1N3haFHisrI59bcmgoobkOB5QKx/wojNngj/
         M/cEc/SivDdFi+FXxRryHFy3zPcfmOj5OykZirV/mlWLXShuFvV5H78p0iYYCIgKmTNB
         XKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780421744; x=1781026544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sy8Vtb9aRVtEoGFrmpT8g6o2EfIr4b6IYQ0R9FDVQbI=;
        b=Una0IJ29bcL595/otAcuSEW/WO/03nsCSLmdqCZaKsa5/tFWPuwV0myBFCZDoJtnN1
         ZKqRuyerxsv+OCiVge4+eFKzfOw2XxJ+ZK8kgB4r3AIJFMGTgmoU0xtBJKNSqKJOVCFi
         MSsg0Cvv4J55a0MYrxKyImLL/urTZdVDaT7H/ZhS7xH604/r1uz15cD1iAx+1Gd88rnu
         ngyWhpB9MwgZTzbJxIpP85D3cmT37zsV19TCKU2pYMcgb5Bm2GEix9bF9P4R7VHrwHUr
         +sUYHF+o1oKSWkOn/+7AIixMrypTAx1+zxFMr28PzVhgZItgD6eArMgVwxIWk5rXv2gD
         e+8w==
X-Forwarded-Encrypted: i=1; AFNElJ+YdOaFbRpvMO0649NlcEsqSEMPDu7hH9A/wQkrg/q+Hz0DL24BVqquY671FHoTLdNllyaco0oLYbVZVpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoHLWUMsGGYFzftUnsDTzhB1fR+o0dBSiBw/36YrBIjghURFJt
	XXcgZ/ksun2ZDcG09gJbFGTyAxKCne9SxPF5HkK+d/7EuR2Xb+CIrftmQfIvk06X+A2Z2xT5vdl
	hX+8jpLCHI2ZujAWh8yJ/UEf48hs8xkI=
X-Gm-Gg: Acq92OFSjcgFGLGwiDofBqJqXtrt1VOi83utSmCtFL3GOPhLP5tqCtikEFovawADEnM
	qpXWuZVnIcNLQTSNDTEb2Hlr9vX2yWGqDUZo8BeMrebeOQkcOkvDRggPJvtydMGw9CqAdA2QAoM
	nXFE/+l05AQvWZDvLUaSqDn/5l9F8vphBgBKkzbMweXVWLNL6ucNcgnNMQHPZ58Q52lGc7br1mo
	s7tKWnUqbyIbkiAGbjnzdMiB2lZnxYt741jZJklVmEsYM3jyoxVaK4ptOJmz+EPl9j0wt4HThrM
	W1NWrr9b9S8mnkAbOi15lBJa9RX4Yo/SlyN2TVTV+7hGIQYQg7B2vQ5YNjOdyDnkb1kRfdVvYvf
	dkA6TZzbZ80DDvAllfC9B5AgKN1Q9Zx7i4w==
X-Received: by 2002:a05:7022:eaca:b0:135:1b3a:bffb with SMTP id
 a92af1059eb24-137d35880b0mr2802180c88.0.1780421743901; Tue, 02 Jun 2026
 10:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602172920.30342-1-ojeda@kernel.org> <20260602172920.30342-2-ojeda@kernel.org>
In-Reply-To: <20260602172920.30342-2-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Jun 2026 19:35:29 +0200
X-Gm-Features: AVHnY4IH4fYj0xoH_2uVdXFMuizdXwsolNcx2uY1XAgI4kGMR3kZOlpHrAuFbw0
Message-ID: <CANiq72koYvKaUjdh6zXOfJk_=4vOQK7Y4qh17ChWPGvir9hmnQ@mail.gmail.com>
Subject: Re: [PATCH 01/18] scripts: generate_rust_analyzer: support passing
 env vars
To: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Jesung Yang <y.j3ms.n@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:tamird@kernel.org,m:y.j3ms.n@gmail.com,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@amazon.com,m:yj3msn@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-13524-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,amazon.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85E47630C4A

On Tue, Jun 2, 2026 at 7:29=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> A future commit adding `zerocopy` support will need to pass an environmen=
t
> variable during its build.
>
> Thus add support for an `--envs` parameter, similar to `--cfgs`, that
> allows to pass a map of variables to set for a given crate.
>
> This allows us to keep a single source of truth for those values.
>
> No change intended in the generated `rust-project.json`.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Cc'ing Tamir and Jesung for this one.

Cheers,
Miguel

