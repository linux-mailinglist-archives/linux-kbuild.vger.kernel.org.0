Return-Path: <linux-kbuild+bounces-10729-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGn1MldWcGlvXQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10729-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 05:30:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 496615106D
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 05:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 54B5D88C5E2
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 13:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9A942EECD;
	Tue, 20 Jan 2026 13:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEuHPMSv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B8542E00D
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 13:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916330; cv=pass; b=CTLLkdi/kvOREzT/rCRKqlmd6+maLr5CJAKTjIMvaaTDcigOTcM75JuzI8Y0CXaOYDJ8KBcwAo6PEgbbnofyCC0hnwo+66JaPB3AKwjRKePWxckw2e9UlXv1cptQ0ffmmtmZq4uGQPkPpyG8+FFoMZM/3MhkWDFm2y3MTfVc1QA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916330; c=relaxed/simple;
	bh=SznF6db3fgh7dj6jHEF0swLk5Nz5mEnPdExmVdEzVj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qo9P5+QLGV8/RCJvQb1M3zap3k9yZkLeZydafrF5uqt0jTdgATCmj08wdGrOgkwsORM0UDkus1DFrURgxgcn7ocXHIezEIEshGATn7q9dzaqiAzPRpoiTs58R4drmlNnTQ5fCAcZDPqxbzG3/fXL7bbjmeYYPwYyfvNZbTj4uKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEuHPMSv; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1233e05c77bso266585c88.1
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 05:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768916325; cv=none;
        d=google.com; s=arc-20240605;
        b=hPVdK6au5rjadE0rFNiXJ4xgYYF2zFRl9cBPT853f68Zf0xI6ZrEcUMk1MdjiutDIl
         X0Xmbci6b6SN0bbqO3M2uB0ChiwyjLjNU1UpzyII5K8h3DYpmyzLtgzuQVXxxyfYnY6d
         dJufZZePajmwF0/yPFPlnTJwa82TbfGl011DbJjLuSg7Xz2eVF3f2EKLj8QDThxkev0c
         3FhjGwsdyg3kHBTNZLCALpIQqLr094MwHqJMGGBvlYm6BxD8ZW9WqMUjBDuOCD0Oe8NK
         0klymmS3lCJHFWpFrechMbfniVndBpJquGEwkWqZZNF2V4V8zZCJ3xXWVfDd3NO5QTti
         2YJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QhVXI4ukImXiW/E1rib2cPI5kyplJP0Bh1o3PRKkVpU=;
        fh=VLoqpdSmk5MYompFG3DitkWQrAQDHkLotAkX6P7N/RM=;
        b=YwqMNSUwCGdx1aPPHZZuKCl27naWQ5+QScnqMrK0twDGJceIEEdXfif1irboCywyOR
         5YpCdWHEzY9jp/CgPMMTH+XXcPaEEO7WtyRDDu2oV/PsnIcLyq9Rcx4twV9JjibM6Hd6
         zOLOjkEvjRHR8zoVb8WuPQq12evGo0qfFYZjE+dgB1uZ0YtNj7wJa+sshMDLDi5DwPwJ
         sVyX0GYaaTCSgQHEuZqqyyiMT99Yi8ikoU4GJZbA6qJEGdWh6etLQ+c1qvRhjJR3OwSf
         cDrCJeVm8bahy0SW7/vFMejc5MgqAmvXskIiEgkDyVnAKnPNQUdz5j3YPcMRVFLBgKGT
         mHQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768916325; x=1769521125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhVXI4ukImXiW/E1rib2cPI5kyplJP0Bh1o3PRKkVpU=;
        b=hEuHPMSvFs9GdU+eJBe5bS/t0AAj1l9gCq6u20cwYpmqjL4Sa7PWqBXRegRTNzE7NA
         +61piqBdXdI+PGXEcVUeLsptJk6gS/SMh7uVVRl3cRr4IZuCCMGUynVHfJjoNBq8kgjm
         p9f6qXvdN0SYFc21OsMDzMmVX4dmfIt38qc/VQB3vHPCAQRR+P3W+4kx2HW7XIpWpGtd
         ZFKteuAyh5+2d4nR5mdWj008yOjPPQin0oJDF2JMMM/xgbcUdli3fcdvHEXMpK6APWoU
         882uNX9p9zntEewghQFWwuQapLEwLP/qKC30yTV+kVQDmKFFDMZ0mmp6GG4o4NukER6+
         QFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916325; x=1769521125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QhVXI4ukImXiW/E1rib2cPI5kyplJP0Bh1o3PRKkVpU=;
        b=O2pDrF83U+fOES217RYumK6iBz5H+lzoaeOKLLQwEY18mUms2rlnmZYzYpav+NoO58
         VHarrijJcnIsC7dWejXvJx/EW6uXg0k5qq4JkpszWOYDAgW/mTrJc+HE6vn7lBWRoxJi
         9wGt5upANiJRAzmQEGns2NYhisvgT8edsjsevQREgWX+IppELnWIhXdaOBu6/J/LD00f
         oOACVxZcyd6QJBaOqjuuUnER6Lp7hTzPPChWRt9b58EoWRekOu6xh/gbakNxBCAe333j
         +iRkdhlpbSbe7hpBFSRxyA+KYFBq6vTxPBCCsECZz4in8uAYXUTX4QvyvJRjRmRUhKpU
         e5vw==
X-Forwarded-Encrypted: i=1; AJvYcCXJMBZnMjbnG53NgZsaUf+f2nPFbCTWYCwD4FLjbYE8JACiC/JaJ82GQY1E/QKqqhp4TOJSgLHMYC8k/+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZVLjcA7LhCYyyYZbRATYkdffi6x0GFPP4OImJHrqO6BdnSRLe
	egsSyIC+0wjjsPa4W3C5qZIkWytcpagdJZ++W3UljXCzXitkW/Z3cULWcEdjAUnL3NeIK5jUQcZ
	8IZADD+rXIvnSsWK8EURvtOnW1a0gL9U=
X-Gm-Gg: AZuq6aIovle8lKCVSg+wq3TvMM9AymxA3cbOaFqjiwI+xMAZl4yfblnrheBfsjwpkOw
	fzpJBQms83mop9h3rLeHC2l8eZsHYz9uZ9dOIdcxDmD8dEcDwICpIz2Z2qoxgpuarMDw75t9tqv
	yHcfhHqIRksVBe+N7J7NFEarb+Hgpl4FNixengeCBpGut9ntMnip8ZPd5hTCpBhtXUJOykwMGPc
	l1rAUv6NZgq9RMmVVVmXy1aGlb+pgs5Uy6GY+0x5ry/xQflC002aUowSP0pdtrVww5pRHfefmxu
	qP01ASuWdrhyG1TLnf2gvaXfuk+QuEyg3MkJIvub1owW5LwG8F6R+ow8dRcnRRBCXGv5V0QD0FK
	3RxdrKvZ2/KM4
X-Received: by 2002:a05:7301:3f19:b0:2ac:2f3f:250f with SMTP id
 5a478bee46e88-2b6b3efe903mr6404610eec.3.1768916324925; Tue, 20 Jan 2026
 05:38:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com>
In-Reply-To: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 14:38:32 +0100
X-Gm-Features: AZwV_Qjz1wuPfQWkIWoNT_Z25qaYTJnwL7_LlXbJYtFdbq30ZnczlTtp-GgGmgo
Message-ID: <CANiq72nEW9H2nhTpz1X9LoBos_taVOuzHX+LHFpPiiYJV4Viwg@mail.gmail.com>
Subject: Re: [PATCH 0/6] scripts: generate_rust_analyzer: improve
 rust-project.json generation
To: Eliot Courtney <ecourtney@nvidia.com>, Tamir Duberstein <tamird@kernel.org>, 
	Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-10729-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nvidia.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 496615106D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 9:54=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> This series improves rust-analyzer rust-project.json generation by:

Cc'ing Tamir and Jesung, who are becoming maintainer and reviewer of
the rust-analyzer support:

    https://lore.kernel.org/rust-for-linux/20260115214545.63262-1-ojeda@ker=
nel.org/

> There is some overlap between this patch series and ones already sent
> but not applied, but it's unclear to me what the status of those are.

There is overlap, yeah. The multi-version support (which I could
imagine they may possibly want to land first before tackling other
things) is fairly clearly on the "being discussed/reviewed" side since
it was sent some days ago:

    https://lore.kernel.org/rust-for-linux/20260109-ra-fix-primitive-v2-0-2=
49852a4145a@gmail.com/

Thanks!

Cheers,
Miguel

