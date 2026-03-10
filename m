Return-Path: <linux-kbuild+bounces-11768-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QO5PNgwBsGnOeQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11768-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 12:31:24 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C39824AE6B
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 12:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59B0F316CDCF
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 11:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D90F3876AA;
	Tue, 10 Mar 2026 11:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkJHucYB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095F3387343;
	Tue, 10 Mar 2026 11:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141640; cv=none; b=bN7U5tluspQqVD3OcHtWfUnTCZWMFjcNSVVL5usacjCUfFKPM9B130/wmCQLQcSjdmXc7ygTl7rsO21UvuUKCO3gXVPPJnAV/Xqdcp3XOnGzC/wPou3u1BbRqn+bGlN+1jJWYJRpuzhXA32CNXOR+NGyegtZU1OKwgs/+nIf7L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141640; c=relaxed/simple;
	bh=xGjVBeTYpyjTZwX3gFYF54w9+q8HTHPh6xi2cya8jck=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=eEnzULGdGWf28h6HsGtneTqYjTWbPjo+BaGddtm31Ik7e56QP3jPeZT8rHuNGzbVbc3teMl3XqSgpuD7Eq5qh4j9ycUUOjaJ7OOg8Q0Z7DPI7vwBFq7qWGRBvDxoHftv6Io5NTqsdFz2sM1yYqIcyNqf1weP4dR7qg6WgWlndD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkJHucYB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB06C2BC86;
	Tue, 10 Mar 2026 11:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773141639;
	bh=xGjVBeTYpyjTZwX3gFYF54w9+q8HTHPh6xi2cya8jck=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=fkJHucYBWZLi6X7ajADYfz3hex8bL9zwxxf+Qg3QdznH8ruuShORbyaf9dUBWKX/k
	 6IMV9Es4zvdNSfxvDlqIMwT7zIdwOLAuxhMhzKIsfgLA6HLecsylVuJDKzGC8cuNkf
	 LgqHol1mk5uZmDxj7FqcxlgCxi3W5AVSAWd7ykXP9sHcykWOuPx5SbDsfELXrF9BHS
	 HmU4OEXbmHGyc37rBbdTcH9za6VVEoNQCk/3piTjjK02V307rPoqT7DWwRSDv7JVAP
	 0V0VL5KLuTW/tKbUB6bq3SmsOuOZ8oIUH2Ct9ebL0+m/iaoiZam6FXuUeTSZYs0enq
	 4owbJQt4gDS8Q==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 12:20:33 +0100
Message-Id: <DGZ291D7Z9ED.FMSHMARM51HP@kernel.org>
Subject: Re: [PATCH v4 4/4] gpu: nova-core: fix stack overflow in GSP memory
 allocation
Cc: "Gary Guo" <gary@garyguo.net>, "Tim Kovalenko via B4 Relay"
 <devnull+tim.kovalenko.proton.me@kernel.org>, <tim.kovalenko@proton.me>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Boqun Feng" <boqun@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Abdiel
 Janulgue" <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <driver-core@lists.linux.dev>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
 <20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me>
 <DGYPX7TT8A4E.3KTO5Z5RS17B4@nvidia.com>
 <DGYQ5EYS1LB0.TP93SPR5Q3BX@garyguo.net>
 <DGYQXEUSVZ0Q.23B895V08LWQ5@nvidia.com>
In-Reply-To: <DGYQXEUSVZ0Q.23B895V08LWQ5@nvidia.com>
X-Rspamd-Queue-Id: 7C39824AE6B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11768-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,proton.me,google.com,gmail.com,ffwll.ch,protonmail.com,umich.edu,collabora.com,arm.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,tim.kovalenko.proton.me];
	RCPT_COUNT_TWELVE(0.00)[24];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Tue Mar 10, 2026 at 3:28 AM CET, Alexandre Courbot wrote:
> On Tue Mar 10, 2026 at 10:51 AM JST, Gary Guo wrote:
>> On Tue Mar 10, 2026 at 1:40 AM GMT, Alexandre Courbot wrote:
>>> On Tue Mar 10, 2026 at 1:34 AM JST, Tim Kovalenko via B4 Relay wrote:
>>>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core=
/gsp/cmdq.rs
>>>> index 0056bfbf0a44cfbc5a0ca08d069f881b877e1edc..c8327d3098f73f9b880eee=
99038ad10a16e1e32d 100644
>>>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>>>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>>>> @@ -202,7 +202,20 @@ fn new(dev: &device::Device<device::Bound>) -> Re=
sult<Self> {
>>>> =20
>>>>          let gsp_mem =3D
>>>>              CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_=
KERNEL | __GFP_ZERO)?;
>>>> -        dma_write!(gsp_mem, [0]?.ptes, PteArray::new(gsp_mem.dma_hand=
le())?);
>>>> +
>>>> +        const NUM_PTES: usize =3D GSP_PAGE_SIZE / size_of::<u64>();
>>>> +
>>>> +        let start =3D gsp_mem.dma_handle();
>>>> +        // One by one GSP Page write to the memory to avoid stack ove=
rflow when allocating
>>>> +        // the whole array at once.
>>>> +        for i in 0..NUM_PTES {
>>>> +            dma_write!(
>>>> +                gsp_mem,
>>>> +                [0]?.ptes.0[i],
>>>> +                PteArray::<NUM_PTES>::entry(start, i)?
>>>
>>> Does `::<NUM_PTES>` need to be mentioned here, or is the compiler able
>>> to infer it?
>>
>> The function signature doesn't mention NUM_PTES at all, so no. In fact, =
perhaps
>> the `entry` shouldn't be an associated method at all (even if is, it pro=
bably
>> should be of `PteArray::<0>` or something.

I think <0> is probably the best choice for this fix for now.

> I had that thought as well - this calls for a redesign of the `PteArray`
> business - but also didn't want to interfere too much as this fix is
> very much (and quickly) needed. We will probably re-write this once we
> have access to the new I/O code anyway.

Not sure it actually needs a redesign, as I think this just goes away with =
I/O
projections. That's also why I would add the following TODO comment on entr=
y().

	// TODO: Replace with `IoView` projections once available.

I.e. it is just a workaround for now.

