Return-Path: <linux-kbuild+bounces-11747-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKJWNGRMr2noTgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11747-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 23:40:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ABF24248F
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 23:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0D95308F819
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 22:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64EE738B7DB;
	Mon,  9 Mar 2026 22:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKzKCvI3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375F73128D4
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 22:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773096019; cv=pass; b=FyRDhu7A4jThZ91Z84l94rfAyYjky0mEmOGuhvjiJKR8zrgSfYuk07H/Zj7Bw0FFT6RwhSdP7A65NAaf2ddj6Q8P2w+Kmtn8lwfm51nYKl7OgP7p3PPa8wLBlb0TYsZbDifoGhR4SxRRJwkXc9FBEZg8Bp9rapKBYcppuoLT9+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773096019; c=relaxed/simple;
	bh=7ZruxRPvWNkf2N29j9GJ6qz1GqSjD5GFtkioQbQCT50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LOL7eW1+mXF4e5vK1pB/AtGJzjzAHWROTIlBt7Yusd7tUjBw4y5+8X/gZ9mm5Ts3Fa5cWLWGVptOZZ7Cqv5DK1j9+D4PihWUFX63h34qiKSfPTD2GTq354ftNkAL0+MJuj4uBBQN00I0R/uLSWhzAndzpELZnyoLYMeIujju04k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKzKCvI3; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-128d428ba0cso124251c88.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 15:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773096017; cv=none;
        d=google.com; s=arc-20240605;
        b=YzKOMEmrjYYMD0WO8HwvbZXqCC5n3Aya5+tCHskOstie7ZBMVU7/2JmiwNP/HVjkps
         ohkFh+qNPsNQoaG1tRk4P267kQQ9aSgyZ9FBaJgewOynUlyEFR+AswkTwOOgkXECfEoy
         Oui7cnDn6c9RBxUHWljOFz6X1vSGVE3UL8Dd4z/rxs7SoF/lANZ0WQJaPM62cioYhS4v
         /1pYOoKDj+vdCMP1Twl7xiRM55pDPIg3SKzXzh+qjeSCBVg9UnqmZy5ASOaaAYPfDMq7
         6b3mGipcaEnh/N7mX6/l0PIHBI3KWhShTRJYSalBSvMvIQQa6fRhmydoEEkxSMJnBemH
         J6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ZruxRPvWNkf2N29j9GJ6qz1GqSjD5GFtkioQbQCT50=;
        fh=f/BPxqFMShxVLNkwtHkzx/a9adJxnFWGy+hwVa3y5eo=;
        b=AgoyzM9R4ILTg1EjSq8IKaKLigz5Jw1PkQUEtuZE24a4auf3eoDnGNC2ILlOXIJ0H2
         eutywZH3cVGxaLBvKSypzn3IpX2k0biUTv7gilCeGeOCseLO2rEUe7jz0V0f+jjtfnzB
         KfPeE+8BUKnTevFtfmwOUIxUAQBgj2YZNMKqfdEIf5OYl825C2qb8kWrV1/ufFH0gQK2
         tiYlWASgUCpSadIow7QjbTWvA7FBoQvnLvBAbfXOgNv75oUwXVgm5Fw4i5JIjSYxyf85
         SF5o5zidN879XLWpO+rXqB83pJFSFZRtuJbxqegHwUPfBI8QxfU1c5v/5Gmj4v6Jar+p
         6Szw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773096017; x=1773700817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZruxRPvWNkf2N29j9GJ6qz1GqSjD5GFtkioQbQCT50=;
        b=OKzKCvI3qaATyuK2rCUsFNOh0qp3Z0G1ELbPYx9YwirY4TpoNA2CQjLGs4kTNTUl/s
         0egq4WVTVMVe8OkXHc1/mvGHmWonwtvOTInz7HoK4eD+ry5OGF5K2jNS+L9IDJw3BkaF
         /9huU4wttGlP9s1u6Le5GhESqsDU4Lb3dv3gfh323G25SHqdIn5da+mdRX+4WOQYqroe
         76lt+JdRNZfcSJ74asngJYv8IOIqc++cS4UcOUX3+8FGc3WuRPyDXAudjr/GbMhbWS3x
         Tg02Aoa9/UZU4bHSV0lhF5RVUnmTBeODX3yOYRYss3aleD6nUz4SbG342sR3h6sDbpzP
         oMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773096017; x=1773700817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ZruxRPvWNkf2N29j9GJ6qz1GqSjD5GFtkioQbQCT50=;
        b=RAfzImd5I79G7ASzB+H10fx2Vlrpx0TZYBXFKeJJFX1d2pi7SeUoLgrO/kDVtzbAEh
         eAO0/9VP337D2ro+7GxgSYXTTFmXwreVAaorBZzu4FJ4pzyWl//qaZJIQUcdnK2YfcCG
         pRDhcWsVlJXVIe8n5pWjrygMScDUphVU/ZbI+/IW9FEGC8FFE/cGbqdo0h4AA0eMDnVL
         4Lp19QB9Ts/UFPUqtEcrKBMvMrnzJmn4gSuR1YqBYNXUzQqQIaYe0ySm11lvzfHSDArQ
         z/ysXu/ElIX88KN8NJZLt/6DkY9/G3rbrh3LC1idREDvGpvEcSHhFiHhMuRTfi9Y8lQe
         sTBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRUac8VOde16mZmQZbZ4hKcGesjilzihea8wQHIB5aZgSjDlnGO+kBW9HkSRe63VLiYqRl8KIVbCXsz/s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0NaGSBWEEG4sag9B3Z/wXRtWpKM12ztfkff34x4LDgbSD6ujH
	kpBRKoE5KQs6e2WcGM19oYggQkSYgVv4m98w1XldF3DnfK3+av0OorhdP2xqSpdt48wJhAdsVCH
	zve6KM2qEGb7u9h00M3fV7wlONg9YcYY=
X-Gm-Gg: ATEYQzx5SjwKkXdmoymA/vRWZgRewjIddeRjjeEZlrOW+kfXg9kFJ00WvsgYuOoSOVW
	zPr8IDS7OqeGmgcA/3Izc8DZPcRf7BcexFygA+sM0yeSG+BJM6yXkGCbx8y1yIG+0yYUqXAik5U
	BEcvnsf0/ckMi+P7ocTdwn8PPg+2RxRxSSGfYUOhpmP8DXc65tWgFnY5hQqpRXbtVGx57F3dYrZ
	rf1WQCD79Jlsk70BjjBRGkYZkxhSsAOwXbKY0SWrJc14mGFCF/piQiCDKoCW6rBPafcMXmVzzKG
	rKFSON9o0J+XMu02T/3Qd2m2rvGhicQAfYSGfpqJjGV4hHswEXs6YaNKARZcWduey3YXV+oDal1
	nodtT7bAxIzXYK9Pf3me+jhA=
X-Received: by 2002:a05:7300:148e:b0:2be:2912:ff65 with SMTP id
 5a478bee46e88-2be4e055899mr2839234eec.3.1773096017354; Mon, 09 Mar 2026
 15:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
 <20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me> <DGYI9CQRWXU3.XNDVWJE0DP6H@kernel.org>
In-Reply-To: <DGYI9CQRWXU3.XNDVWJE0DP6H@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Mar 2026 23:40:05 +0100
X-Gm-Features: AaiRm51i63wiK9zFG4xNzbBEqTFq-Q0BP2B6Ia2Eg8BVDjn1989Ch1oIVRSK_CU
Message-ID: <CANiq72nRZhJV3d33h++jYp1iEO3a=+pqrzZXf690Bbafs84qbg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] gpu: nova-core: fix stack overflow in GSP memory allocation
To: Danilo Krummrich <dakr@kernel.org>
Cc: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>, tim.kovalenko@proton.me, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 60ABF24248F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11747-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[kernel.org,proton.me,nvidia.com,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,tim.kovalenko.proton.me];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,zulipchat.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 9, 2026 at 8:40=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Reported-by: Gary Guo <gary@garyguo.net>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/509436-Nova/=
topic/.60Cmdq.3A.3Anew.60.20uses.20excessive.20stack.20size/near/570375549
> Fixes: f38b4f105cfc ("gpu: nova-core: Create initial Gsp")

`objtool` also complains about it because it doesn't handle certain
instructions, so probably:

Link: https://lore.kernel.org/rust-for-linux/CANiq72mAQxbRJZDnik3Qmd4phvFwP=
A01O2jwaaXRh_T+2=3DL-qA@mail.gmail.com/

Cheers,
Miguel

