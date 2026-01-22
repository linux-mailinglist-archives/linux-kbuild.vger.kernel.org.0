Return-Path: <linux-kbuild+bounces-10803-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJttBDAIcmmOagAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10803-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 12:21:20 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B81D665E61
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 12:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2E4FA6CA342
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 11:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0713436923E;
	Thu, 22 Jan 2026 11:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEyVGh0r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F78D28C860
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 11:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079991; cv=none; b=LwvnHnathq8wDHB6nN05Pm3iPBzvpgcKPaBpyv0t3H19ZNjL62ZTojeeoAkTHc8YbqzmBeFW5yhoiTZkN9jDfZ1uLQIEL3z6RHyDhJnMk+AUqQOquJKRsjSyLlR0TIP5R+4m3RJeiMCG+DS1g35KWaT9cQ+HtsXjesJZGVLj5XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079991; c=relaxed/simple;
	bh=+BN3fu2KYuWm2waqZbfkCmHZJSZleUYQLM48P2u8J+E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VXHvIDc12oXNHtI9di9m/7u2yVdgVQBI7Ega78fq2yQ7IRFZUAQCJ6++S8ORG9AgKuV9MWgQ8Fxr9BW7A2B8akOkmYY3OFMhZP7JdYAglAjnOQKQX6JZcTl5ukRYECF/lHV9vZUEzIANREfAaq0imFOk6Ans0KRJdl20/Hg0Ocs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEyVGh0r; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ddaso546585a91.0
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 03:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769079989; x=1769684789; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BN3fu2KYuWm2waqZbfkCmHZJSZleUYQLM48P2u8J+E=;
        b=QEyVGh0rA7oB9EYYucW4OzRGepOsueE9WPV89G7BkVBHkSepMq/ID0CfeJs00qNIQe
         WnPHRqgqUM53jg0zMDnE3nAgfqNWVFUGpC9bMKun5Y52ZDMdf0/O04h503YxFSnUMXJS
         Lq8KlTdp1o+aeXWxWFNLbVAUeQ8fF1YEWB+gW0pGjSUZ2iwfO1oooIePcGn+weVOAz+U
         cCFHX49GYLsqJTkIuZyffG+UZ4LgAVYIiFTLm8ySpPYPPg+duUslUpSd4pb9eEbkfuuq
         GDktMGH9C6lFj70CSuqcWA27vREdp2q6ltAsWr8jW6mD4Dc1hzFEG+NyjzXZD8IxDGL5
         9gaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079989; x=1769684789;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+BN3fu2KYuWm2waqZbfkCmHZJSZleUYQLM48P2u8J+E=;
        b=sKkhxVUvn8rQjkPbgJpKGpcof24UGW9TJGnx4CRzEjN1A8PicpnPfaLTt/JD6gV7Id
         Sf4ejfLMJRDPO40K2keRKiBfTjui3BlpNyoxIPxl9RtxAwNCRmyuCgLv5gtMr16EqTf2
         yjEfDCp5vbrBZ/xpLwnmUaiv9gA2eoYmqJk5z5es6RHPm+n4Lier6BYzZBL1gVKvzbfG
         rOz4mWvOo385uwH1BxsDBXeyWAjlQVfLf5IgNnJCvhIZqIu2jcYDVu640LpMxQnhb0PG
         XB22PYTU/LDo1wWvEuWy0+TEpLU1bhzZqI/NPbgBqxJsWNbcHE2mM1s8GiQxbIoP0/FA
         tNNw==
X-Forwarded-Encrypted: i=1; AJvYcCUyswMzaZ1rBd2p4Pyqx0VLz4fo/9zvfvXtVzp3hZdBTEnp1KlFUnIcv9K9fzZRPkb2eK36KrpcvlM58mo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkn0dkBlwh7eL4BNgwN/bRS5iWxd/UQYF2EQ4cG2H9l41zm2uy
	5PVoAzcizyc8m9/KairBICGifvCLf+1pUoGw61/PMmDxEmiNt/Jb6nE3
X-Gm-Gg: AZuq6aLXTVuE9Tt5apzWQoZ/Qw4nduvhEuMODPoxkFw/9s7qjnr+D3rcxHDwM8F1Klt
	badTQNyDfNtCJaRCoiRJ4UBUU5VpRPG1KtLpp/DUpDRbpJ5/YoBW4V48z2JCz1FFkhmOvr6yh9g
	QqWK59iE7d3yMfOxk+FUiQUipV08mocitfIz5naHsib1eT6OPjzSwNeXM+0SxC6oHBVEFd8iNJ7
	or7GScUI7zkQzDuQnbigo1E7aDmfDP5/VdRT9ngnrzgmGiWYcxps//W4fHKUUGrOU5M455uc40U
	U4y7iRC9mGYXx1XUdTU2FBLuCiSmuBDpa79Idbb1mOdtwFNsFZS3c+1fQLjs96pPOOEDv2XiUr/
	uy12npad0Kj8IV2wKC6QXOJjH61b03LtnrjjMhjjhiGgVDmUWqPx9mQwKNju0SabPMl1Jb/EAHx
	DPeo8AEICX4Qv+CzEW
X-Received: by 2002:a17:90b:540b:b0:340:bfcd:6af9 with SMTP id 98e67ed59e1d1-3533537d73fmr1956414a91.3.1769079989292;
        Thu, 22 Jan 2026 03:06:29 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3533525a83esm2131542a91.16.2026.01.22.03.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 03:06:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 20:06:24 +0900
Message-Id: <DFV2IL7N8X9O.2DLY12HALP8AA@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 6/6] scripts: generate_rust_analyzer: move sysroot
 crates to sysroot_project
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Jesung Yang"
 <y.j3ms.n@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com>
 <20260120-ra-fix-v1-6-829e4e92818c@nvidia.com>
 <CAJ-ks9k_c3hq9ov8nqXLakkC6=Ly1+Fr3kbQ8BUbAQrRcHZhqw@mail.gmail.com>
 <DFTTQTYK1KNF.2N1PS08QIAID2@gmail.com>
 <DFV0C3T2RXW8.1F3G0Q7R999TC@nvidia.com>
In-Reply-To: <DFV0C3T2RXW8.1F3G0Q7R999TC@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10803-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[nvidia.com,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yj3msn@gmail.com,linux-kbuild@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,zulipchat.com:url]
X-Rspamd-Queue-Id: B81D665E61
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 6:23 PM KST, Eliot Courtney wrote:
> On Wed Jan 21, 2026 at 9:01 AM JST, Jesung Yang wrote:
>> I still think the versioning infrastructure is a prerequisite as we're
>> using the `sysroot_src` field here.
>>
>> If we specify `sysroot_src` without `crate_attrs =3D ["no_std"]`,
>> rust-analyzer treats `std` as a dependency for all local crates by
>> default. Consequently, any rust-analyzer version lacking `crate_attrs`
>> support (which silently ignores `crate_attrs =3D ["no_std"]`) would
>> incorrectly assume an implicit `std` dependency for all kernel modules.
>> Having the versioning infrastructure first allows us to handle this
>> transition without breaking the user experience for those on older
>> toolchains.
> Yeah, I agree that specifying sysroot_src by itself includes std and that
> is potentially an issue.
>
> But, currently due to issues like the relative #[path] include, the
> sysroot crates aren't really processable very well by rust-analyzer
> causing a lot of spurious errors and unresolved symbols, which make
> using the LSP experience pretty bad IMO. OTOH, while the sysroot_src
> approach does include std, it at least makes it usable. Personally I
> find it more useful this way, but I can see the argument for both sides.

So the problem here is that the versioning infrastructure effectively
restricts the use of `sysroot_src` for older rust-analyzer versions
that do not support `crate_attrs`, which leads to yet another bad
experience. Hmm... I would like to hear others' thoughts on this
trade-off, since I don't have a perfect solution at the moment.

> Tangential, but I'm not sure why the drivers don't specify no_std
> themselves - then we wouldn't have to worry about this IIUC.

Perhaps Miguel could chime in and give some details about this, but
you can find a bit of context here [1].

On a separate note: I actually have a previous effort covering
`sysroot_src` and `crate_attrs` [2] that I'd like to land first. It
covers almost the same ground as your 6th patch (minus the
`sysroot_project` use). Since I wrote the `crate-attrs` code in
rust-analyzer itself specifically to improve its usability in the
kernel, I'm hoping to finish the full story on the kernel side. Would
you be open to that?

Thanks!

[1] https://rust-for-linux.zulipchat.com/#narrow/channel/x/topic/x/near/561=
668361
[2] https://lore.kernel.org/rust-for-linux/20260101-ra-fix-primitive-v1-1-d=
ef809357b4e@gmail.com/

Best regards,
Jesung

