Return-Path: <linux-kbuild+bounces-11492-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xNnHJYp8o2noEgUAu9opvQ
	(envelope-from <linux-kbuild+bounces-11492-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 01 Mar 2026 00:38:50 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E00BB1C9BE8
	for <lists+linux-kbuild@lfdr.de>; Sun, 01 Mar 2026 00:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A992303A8F6
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Feb 2026 23:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A9635AC26;
	Sat, 28 Feb 2026 23:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+62m04m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6200430BA7
	for <linux-kbuild@vger.kernel.org>; Sat, 28 Feb 2026 23:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772321919; cv=none; b=cKWKrlZ4Tnar4fCMwdEgJJrn2PBR000c2Rg5Fb9qumt7ZKPb93bE5XxMPmm/6rI7EEHL74EfK3EPUS+NK4UozK4PGgmsFTgeewA9dv6fE75YnSXjHKKyHBJeHoSGklchs4LUrnggh2CRzVD9+/cm81BSoY0vZFkmGiAjEcVJVv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772321919; c=relaxed/simple;
	bh=AW5T9Hc4nbKkDkGmRXK+0jMJLHNhZgY/umP29NnIa7A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=AijOUldn+a2PXdRgCuhicSTLCGMzReROTVVa3xutPluFJJH+1yNXrDyHoWrWfokZWIxIL/TnHWp04bUcJ9wQETy0Mh7/rSKNhBBHwdPhBogQP/E2WuOPfLuQHsBnkKUOxHvSrLdWkoSoSFvg8YbBOJd/Rup/MepfoszJ7DvmPRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+62m04m; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2be06c02f66so249382eec.1
        for <linux-kbuild@vger.kernel.org>; Sat, 28 Feb 2026 15:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772321916; x=1772926716; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hziZ8HwNJIKxde4jYjnTUIsaI5Anyr71P4ZGtylHymA=;
        b=Y+62m04madFEPG2Egzu4UaSzjbGXDICKcnrhiGXXheiJIWV8XF3Ust9Lzm9XRj1NOg
         NxhlxYWqHfePx190ZNflO9TjXEQusCNXYWz83MgFxaozOytFzerq/9V+8uZfNiZNTmqg
         I2Xukgvhy5yyMIjnNFbXDXsRFHnzq08+vLusCHGX3tNvszdulkTZO2A5CRx6QM4zGw16
         Le9evq6pcjjH/ADl9nr3Zi5Q/NYUnRSe1JbL9XbR/o+QkVbteknIsqaQTv3MitFMVuc6
         aAKwQqZhrUgL6ix1dd8js30UPZKEl3mraiY9wu/kr7LU5Rxm20KjYYQWodwNMeEsRi1U
         Yo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772321916; x=1772926716;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hziZ8HwNJIKxde4jYjnTUIsaI5Anyr71P4ZGtylHymA=;
        b=neLsgUr05u1m4Hyk+PltdzOnPiG4o6AlaYKqplxg6mUH2d4/qAHnWfOYfpG0Fs3bJY
         7OaRLdB78Y1z48WULhcdvVTYt32jS+p6VB0ZlD5+KKrqBH4V5rIhag0RVUi22SonLnun
         izMSb2ycY8cWy7iA9n0rP/PuSEZm0AcPEEXp1dA5yBCY3y6L5IwiIeVIjx+VNNtEADA/
         Nd68cKj9M1mEpfDPgEpMUyAofMUTEiDYNyc+wClyGdIlxMOQz/ZUuykZNTW1x6dXsOxI
         9q6RS/pqGwdBk+LpwVNNXB4BVvnOCNz8ZcTw9rZY7NzvAisQQ4wwdzw0LGOaoQxOmf5p
         +CBg==
X-Forwarded-Encrypted: i=1; AJvYcCXOGhE8nhi/nro/Pfxjx/OsO3cMZeRLHywftZDBIBcM5WV/T7HGDMZt4EdGWdGh8XVnlDjUErnMDNQKiw0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Xy8e/Jg6bcEfwNGZaPdXESp8zc98x1Wq6cqbwSVYgey+lrJE
	xQ5JOJI50zE27ykWCyRlyucKIQXxUb/yL+PBbNPRkLOjgTClo+RAAqH4
X-Gm-Gg: ATEYQzwxcJmSxWOcm1vcc2XpU6eV24YYAS7wVBac5Z2RrqMET4Zd+5TKC1f7Bw5CpoG
	ATrBlLycJFf0gpS4Rnm9ST3gvWdCcX56xNoKRCSYGZ+RKvwD6PfCFf8dkGUnJEaKOPtcD+DcMkJ
	Piax5+6Ho7AtJkA8+n/3BHxCsN/NjKET3YRBjaNvZ5DOmDJpNWu55m0sNlnFIRuqSwe8nvB5AUT
	Pl+4D+C39+WITi0p4vZ9cjq6pcVZG/64DEgkuRx1OJG4sHrDE6BuakcA3GSDqWh7kfDktn0hXyE
	r47LJ38CChr1iGBV+Dh69xX91Cv3r/0TDjJzD0rJ/pimBU2waCXyQGAuFNHHnLLoX0KUTMUXCS0
	7UwfE2mbYWCUeRcGDAHBdzTOT2MLeZEKLjNmHrmwzEnGfaHH9ce7+ihToB1oBZoIoY9fj86XmeP
	JMVY17vXJl6TBj3KFXb0abXI3ff7Sv1K1NuK+vyHdNWIbu
X-Received: by 2002:a05:7300:a198:b0:2be:694:5713 with SMTP id 5a478bee46e88-2be069458e8mr203613eec.36.1772321915822;
        Sat, 28 Feb 2026 15:38:35 -0800 (PST)
Received: from localhost ([2603:8000:bb00:9b3f::18f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdfb3f898asm1293640eec.29.2026.02.28.15.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 15:38:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Feb 2026 15:38:29 -0800
Message-Id: <DGQZOLAH72HC.2OE3REDD7M7U7@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: add projection infrastructure
From: "Aditya Rajan" <adi.dev.github@gmail.com>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260226154656.3241736-1-gary@kernel.org>
 <20260226154656.3241736-2-gary@kernel.org>
In-Reply-To: <20260226154656.3241736-2-gary@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11492-lists,linux-kbuild=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[garyguo.net,kernel.org,protonmail.com,google.com,umich.edu];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adidevgithub@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: E00BB1C9BE8
X-Rspamd-Action: no action

On Thu Feb 26, 2026 at 7:46 AM PST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> diff --git a/rust/kernel/projection.rs b/rust/kernel/projection.rs
> new file mode 100644
> index 000000000000..186ec194f2b8
> --- /dev/null
> +++ b/rust/kernel/projection.rs
> +unsafe impl<T> ProjectIndex<[T]> for usize {
> +    type Output =3D T;
> +
> +    #[inline(always)]
> +    fn get(self, slice: *mut [T]) -> Option<*mut T> {
> +        if self > slice.len() {
I am not sure but shouldn't this be `self >=3D slice.len()` ? I could be wr=
ong but `slice.get(n)` should return `None` for slice 0..n ?
There is a similar condition somewhere else in the code as well.

[...]

> +                // Check unaligned field. Not all users (e.g. DMA) can h=
andle unaligned
> +                // projections. (e.g. DMA).
Nit: Comment mentions (e.g. DMA) twice

One question regarding the `in bounds` check otherwise LGTM

Thanks
Aditya


