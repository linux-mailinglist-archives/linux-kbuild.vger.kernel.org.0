Return-Path: <linux-kbuild+bounces-10760-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFBUEJ8YcGkEVwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10760-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 01:06:55 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A780F4E4A9
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 01:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE4B0781455
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 00:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E47481DD;
	Wed, 21 Jan 2026 00:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aj7cv7B0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2D01CFBA
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Jan 2026 00:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768953689; cv=none; b=qi1k4DL7WLYZ/rvNtz6z1i8gJp2WL+hSNHS9yOwhGDo/+uFdXLbvcm3cgh/CIzYLwVsL5MFayAQZbTC98d6n7vvohlJwAnBqhr0IlVfQTJH0DVy3udv0c7W97hYR+nUpR1wjXY6mydJFHoK6QeFAKOSRK0l3Et2lcD0YF4ZO+G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768953689; c=relaxed/simple;
	bh=yRdJQmpTWwZj8gimb94j0TPF7S8boNAdmVxrjjDF1sk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kXXT9mi7nwTyMnDMh/MCeRX5CIf7B/l0vSKYfTQiyWBaPV7Cl/U6BnUTa4i4ApNgbNL1c5iQtX3/7RCiqjFlpeLX1sfYGHcdgdryu1Qkzb/xPLtd0ZgWCqShITax0GvScFaT9xOe2cPkY+dBJ1x7aZ3ulXwRGYBD50+FBzu0UGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aj7cv7B0; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c05d66dbab2so3786128a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 16:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768953687; x=1769558487; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRdJQmpTWwZj8gimb94j0TPF7S8boNAdmVxrjjDF1sk=;
        b=aj7cv7B0RiXLew4GU9ErUHbAz1sreeIe7dPcnwtstuOM9qQjMu5fRgQ9EBmLP+F7XH
         2/xff9vM+4JNgTXv5ZMsuD+uPxhPj/ErW4Ajd9N95PqsztfiZ3SdXF6ZEnPyyRbYIeM6
         bP/Ia+qWB6fHsKu0WHMLddGXW+Ze84HnwWeT6oG11XMQ72f5dcFkjSVtsyTz2mFb12yk
         aXYa0qmtm+jy6LHB7K4CmLGVwaAEiFOaNhVyhouuyeFrg0Zq3/1cG83yiEJbj90rkp+W
         5+Z6tVM7GN7Xv8sQN1Y6rEBEVApAnvQAqwJ+1C+nEMcjMZycdvE01iQ71Cm2dPukq9qK
         PV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768953687; x=1769558487;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yRdJQmpTWwZj8gimb94j0TPF7S8boNAdmVxrjjDF1sk=;
        b=hhdp7DGHcoY8XVM2BLVaNYnDQJzrh0bqG0dsI0KIUQIENjya29YMkhO9mtHGB4VDQC
         LsK3XVpnzd2Aj5Q0t61x179HRnRmZ6k5C1hN0PQM1UQUMh5cO+EkL9b71l5MoBNIhqv8
         rp9/HJcYgLrjaWG9JEVldrw+qJEzurYtJfwC1+fNQQaAfoHdCx14jP/TFdZTB+J8QB2n
         uBuG5JZGORql7USu5G2F96hPHerV7HvPDwdN7PzCCCGJb2am/47M1xuD/22mo0S47D5C
         lI05YMYM6IR2kvkotGieohl4pfoNsslPNNPAOo0uFDbmJg66mog7hoAuVb6dtEd7OyTE
         mzwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyB8zgTLIOAIhsfKwvXGbgv6PcaELh2omjbTXi7HcEbNiweaRzRIvTOXXpq3Gv1Depy4cnnwSW5H2NWkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjEl+o28by/LhqfZUCFADCvBp0EZmjc22WzQmNLQw2AvgZaJXV
	xCq8tX86vtp7SbEfOsmzjUU6pA4gHz66uS5utGAh1tjWJdwsznGMRZPh
X-Gm-Gg: AZuq6aJsSdHF/2+UBBMceiV+9rAZFt6Uid/HywKJhWkfTKIdq4ZYSC0I0U2mQ8XC04V
	bSa2Y8i6A4YVhKU1LCzRWp8swwxb0gnGNSwMEb035XER+g2SGhaND1U4rOxmYxmQc9medY5+bwC
	5zRRUg3yxZGCtjWz6SdLBxmYQWaME7oNqgmQQdHUrtRolSvKIHXZme5xQ0If95bxu/5u+dmPWOV
	S+SXvb9UH+DumORNNIJHQCV0qccGP8cQyZYcB6EAyp6RNtyyiAoLz3MQfeLztfQgzLv+011LrnQ
	RW/laY593yMCMBafR+5yVQ0oqiiBPfw7kRiBX48txf4hF3jalnWsBMS5mnytU5Iqo2syIH1s62p
	TJHnd5YBjlxYVeAipUOJDN5V6Gz1BWQzXCKs/SsxqvbhvB15dncKkbauCXkux2JUa5vkF6jfFa6
	GBBxWqsg==
X-Received: by 2002:a17:903:1a2c:b0:2a0:d5bf:b271 with SMTP id d9443c01a7336-2a76ad5bf2bmr31448885ad.32.1768953686781;
        Tue, 20 Jan 2026 16:01:26 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dedacsm135367515ad.58.2026.01.20.16.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 16:01:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 09:01:20 +0900
Message-Id: <DFTTQTYK1KNF.2N1PS08QIAID2@gmail.com>
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
To: "Tamir Duberstein" <tamird@kernel.org>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Jesung Yang" <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com>
 <20260120-ra-fix-v1-6-829e4e92818c@nvidia.com>
 <CAJ-ks9k_c3hq9ov8nqXLakkC6=Ly1+Fr3kbQ8BUbAQrRcHZhqw@mail.gmail.com>
In-Reply-To: <CAJ-ks9k_c3hq9ov8nqXLakkC6=Ly1+Fr3kbQ8BUbAQrRcHZhqw@mail.gmail.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10760-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,gmail.com];
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
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,nvidia.com:email]
X-Rspamd-Queue-Id: A780F4E4A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Jan 21, 2026 at 12:34 AM KST, Tamir Duberstein wrote:
> On Tue, Jan 20, 2026 at 3:55=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.=
com> wrote:
>>
>> Use rust-analyzer's sysroot_project feature to properly configure
>> sysroot crates (core, alloc, std, proc_macro). This allows
>> rust-analyzer to correctly resolve items from the sysroot and
>> automatically add sysroot crate dependencies to all project crates.
>>
>> Some sysroot crates use #[path] directives to load files outside of
>> their directory but still in the sysroot. This is disallowed by
>> rust-analyzer, so the sysroot crate are not properly loaded. Loading the=
m
>> using sysroot_project tells rust-analyzer to let them load anything insi=
de
>> sysroot_src.
>>
>> The sysroot_project field was added to rust-analyzer in v0.3.2328
>> (~1.87.0) and is silently ignored by older versions. In that case,
>> rust-analyzer falls back to loading the sysroot via sysroot_src.
>> This basically works, but the advantage of using sysroot_project is
>> that we can make the set of features/cfgs more similar to what the
>> actual build uses.
>
> This is a very nice patch, and perhaps obviates the need for the
> versioning infrastructure in
> https://lore.kernel.org/all/20260109-ra-fix-primitive-v2-0-249852a4145a@g=
mail.com/.

I still think the versioning infrastructure is a prerequisite as we're
using the `sysroot_src` field here.

If we specify `sysroot_src` without `crate_attrs =3D ["no_std"]`,
rust-analyzer treats `std` as a dependency for all local crates by
default. Consequently, any rust-analyzer version lacking `crate_attrs`
support (which silently ignores `crate_attrs =3D ["no_std"]`) would
incorrectly assume an implicit `std` dependency for all kernel modules.
Having the versioning infrastructure first allows us to handle this
transition without breaking the user experience for those on older
toolchains.

Best regards,
Jesung

