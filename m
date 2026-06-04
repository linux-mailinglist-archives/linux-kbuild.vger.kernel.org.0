Return-Path: <linux-kbuild+bounces-13565-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BkbILhspIWqR/wAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13565-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 09:28:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 593CD63D9EB
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 09:28:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GnF9PgvR;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13565-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13565-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F0B0B3014818
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2026 07:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8FD3BB11E;
	Thu,  4 Jun 2026 07:28:14 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746EB332EC8
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Jun 2026 07:28:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780558094; cv=pass; b=QkHH/2WGvp40xDJBTd0fZXF3MD9aidHng3i9awxWjv41cW2SF7y7LL6dYwnwpclW1KZh01NPdSYxpMeWpU4eyTCkpJuGljaMo/Tvt5DjZnGpGTWBuPTojvnkcfvjXhYACuhOiJlh0IwevB/Rb4ruIJw+d14sDwCHPmEPnKHinC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780558094; c=relaxed/simple;
	bh=9BRFQxXjY1k2RdP+jwj/2G9funm2lNm/ZgWUqjbg4d0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLTrWkC4AvSUelKcVz96CHm47lO+pTK6+GumyTYTk2F+9I0CcRbXqa86nogn0Iw/GNLG/wfANubCSQSJfHA0oYL8V33euhLb1f6gRZOo1MGlDLB6dFqwBSNAPFiQA1xZgDernG7RAhWq9idyqOKn5URUYem7AwP3fye9LNcay1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnF9PgvR; arc=pass smtp.client-ip=74.125.82.181
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-306f1213aadso20496eec.1
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jun 2026 00:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780558092; cv=none;
        d=google.com; s=arc-20240605;
        b=k5vw5yGjfcNPJUec+ZRfl21hHjjsMQVIai/9E0qporMPgh25UZ8ZP9LssQwX5K/JsC
         i9SAAlc7JT4Tjs01D2pyJ19wkYSjViez1R6GHAmzANeXlNG9iAzAXHUHqN7+/VCDVwzI
         DtR6yktThn/QjT0nT/nxXHA/jd1zSlyDtoNgzlnuc12IBZLbyWGnL0Eap8dkn+heUujB
         CInpj9sKw8FRtLBC0tgTUWGftFzbl0g62zuSQ2/M8V04+CEvGrPNluiN6z2C8DS4ctnt
         EOCNlGxsf/564YiJEH5N2SfnfC8T5bAEFdW5VLXVyBEL/dO3UoJ7hXS3LmKKXIL8IDqC
         6qGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ni83wS7JKDvHsibcin5DOIqjeZAyCeU2HWUB3Y7TJ/g=;
        fh=8YU8Zbt/+xOhqOQyzZrL/eS69RPaTSqhCgJwzTU/q08=;
        b=XugPKXj6IE4Emj+P0lQZXbkZXL7MsGgn+35E/oZb+PfKRfVAzs4qW1qmlCoF8VY/mA
         Ls7U1YyFOvKQ1YHi/4nWS/+NAogyCTZOtC6KJWydmhLGVeqKtHza1jy6v1K8Vr7MGjZP
         w4Q+QI6irQR5zqQU7o5WydHRbsjmyEhWyF6C6N/adDME4FhqXpFYXv9PSWWjxzxPHTg5
         xjeP+wH1jBW6cM7GV4EFwDXUGszStak4WMQmapJDrlVzyr9O1DrKdvrWPAXn5CVAUv2d
         hoZsg5oGgp2nIBzkrhIZPAWeigPqLnhiX77DGrflF6VXjcWZ7ZSo/7bMH+PgXOC7iObC
         fimA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780558092; x=1781162892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ni83wS7JKDvHsibcin5DOIqjeZAyCeU2HWUB3Y7TJ/g=;
        b=GnF9PgvR9onQIrx7jWHRz4opmVmZrlPARkgcnBYwJAPbzhWe+E0W7Q7ztJwnVdV6Rl
         thAU+sWnDNsjvaZjC4ctZSMlE43VSwtC2xpfDdZsUvTTfxK0D2zaSJ5VHRAxo2NYkXqX
         F4dVcFp8gU3DPTv8D7o4ZweS65Txa8xEpF2NzW572o4gTxpzsgfuUuwrVbkAwaYFs5XF
         RmLSTZXotQ+b4DhOBvHtM/AujxQoYByW/Vgr8vhBYc6Ypz4khU+oVxsKG5y7Ka857Peg
         D4jHWEYqgsG9iwndwJMgsT+iuRzXV/NYulMCxP45qc+ouBYtbJl4Ctf1jNX3kLbDQBDF
         PBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780558092; x=1781162892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ni83wS7JKDvHsibcin5DOIqjeZAyCeU2HWUB3Y7TJ/g=;
        b=bgcKRIhJRBH4BB+ZtB8UQIViWf1GyJvqqN685hMYYUqkCJMr8Vs2VIvxFD7gWu5CxM
         xTmtXgXc1D+ZXOaz1a5yvIF2/3Ntg6yGJArBRcSaZsSriQQbshz0FautfSSzrfY/45iE
         3FyAmkTSlM3Kr8/Y1e3dFj/xalVUz9InVolxz3/SIQDWqVOHQQFrIEMYut9RPXM35lhB
         qJc7XQnU8ngNPAX6/CyTJ1ePjJUm1cFPl7/AL7rcY7zHjncgnjpIm7Na0Wc4hj5QEdq6
         6ctoHo3hsrKvo/qGVRJjddLQxLww8OpQTecbNd2EQD3yuuA5AyUkk7Fwdl+0zRp03isJ
         Jj/w==
X-Forwarded-Encrypted: i=1; AFNElJ91o3/WsWbts6Lib6KtPFEjj9TIayXlcpycI9A6qPrkY0A6wgwlehMGcHPfLzRRpwRhPfUVDYXE0MTGeck=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHVaT/8V+K7x0jXGUuV1jwhE4wGTti+2tHTq+hcW4UsqkUL/Tj
	+m5tBHIUikwc+Bq08ROvdMfTtRgXq9ZcJSsC1Q3SiV8OKN/lAek7oKioA4xZraZKQX6pU7Ij80T
	40UZMrnRPMf2fAE1yLw0sNNjWNS6+hj4=
X-Gm-Gg: Acq92OF/pcxPuwx31wf+SCwrN8D9CpmaphC+bCM1Vby4DfbfeRn3AHuRqVC+y/EDlLK
	wqR/Y2dBwX+VUEaSo81mklifKUhjgUQ+9OlsdEVjbSk44N/00h+eS7FHK3lSfuxeMEIi7wi0OY+
	ec6vVlkto90SCVMUS3aTewu/BJycr+rF5wqbJPJLSNK0Q3Zwd7G880VNnFvukM/KtIMcfkf6Xd7
	pcCXoIrBD/QhTvXQjnu2BHmR0kqIOEiVCY3tacuaqJGznVXDRCIO0PjisywP2CR96E5HTyd1o7d
	egZqzfVL3eLEjCzZxXhEZiFIWNSArYRjNR0LIKDhmrM5ApDMKKvm+DUqk480yl/Li4onQbHEvoN
	ml0Lgt0KYltoYsXiwklpx9b/Y/ANoPzLXJw==
X-Received: by 2002:a05:7301:1f15:b0:304:c73b:79ea with SMTP id
 5a478bee46e88-3076a4fe74fmr322506eec.3.1780558091555; Thu, 04 Jun 2026
 00:28:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602151638.14358-1-ojeda@kernel.org>
In-Reply-To: <20260602151638.14358-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Jun 2026 09:27:58 +0200
X-Gm-Features: AVHnY4Lm65x6LZu6zOIIfGuVu-Hof_j5ErOVEWYGfSDESff_BqZowlbGgAsyimg
Message-ID: <CANiq72no3MBBFdV5ZVK-wJrzixwnEkrb6j5QnXMYuZ_=Qjp+bw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: rename flag to `-Zdebuginfo-for-profiling`
 for Rust >= 1.98
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13565-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 593CD63D9EB

On Tue, Jun 2, 2026 at 5:17=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Starting with Rust 1.98.0 (expected 2026-08-20), the
> `-Zdebug-info-for-profiling` flag has been renamed to
> `-Zdebuginfo-for-profiling` (i.e. one less dash, to match `debuginfo`s
> in other flags) [1].
>
> Without this change, one gets in the latest nightlies:
>
>     error: unknown unstable option: `debug-info-for-profiling`
>
> Thus pass the right name.
>
> Link: https://github.com/rust-lang/rust/pull/156887 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel

