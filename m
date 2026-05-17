Return-Path: <linux-kbuild+bounces-13210-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id C+UOLuFGCmpeywQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13210-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 00:53:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 214F656436A
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 00:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 786823007969
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 22:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8723271EA;
	Sun, 17 May 2026 22:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwabBkpr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B88632AABD
	for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 22:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779058398; cv=pass; b=Ykz/hd9vfV0SpKkwxNQTNV4RkDb9OTzPZj62REa6oincWo22giivBw8qL6F9Gpc9K0FdEgPRme/IjROpEd8oXRKzfUC+ggPJaVETYFcLuMqAVnKub5dS5jxyNdX1KmJIEbOun7UPT5vHiYu/S+AL22DOOBYVdZFhduxS2DKnUu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779058398; c=relaxed/simple;
	bh=2mM9qMmNlEv3GNaqlQTKQMssYkdCVk+G1o/Wo1ps+qQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVHiBoLzZ9Hskf97UcT+7FwLEFYDsj9YVKeqFgZpQ9fRlTnLVxU1GQ2UOG9K6oPROIKYH88CqXeLZfD1Aamxnq5yMWmfhJ1YPWiRmcpeFIjP6kjOLur8wsyuxYT2RW7aicl7kmtHvNdJvPyKObYyInC08XT458sufw587iMAqP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwabBkpr; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f6e6a0a215so86624eec.2
        for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 15:53:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779058396; cv=none;
        d=google.com; s=arc-20240605;
        b=d3suFzAJlct5YyeNrKsk55gOOtJ8zMsNuwYnN667o1zjKW+TM2hxiulLR2upAlLZQQ
         QsbkdAF8EbR1bt9wh0V7/zdi/TplPnmt87I8QPv/AJkCzqz9DKlRrfpJOJb0jY9L09Zw
         i3u7kEAQWCJP3Fk5V/4O9d74hYAGzTHHdCDRQU873ykb3O/goDM7DWafzHSvTX+Ikuyp
         jfq+3CNtvtfTw6QbrGu2DJloOvK40Lmypu0i7ORwNJy8U72RTbHgrKO1BD6nRLR1+6wO
         hNXQKsHscb6WuqkGeKGuwfoKppKFysTMaSsgPcXndBHtdOOsp2J6BlYDxbU/lutByV6j
         fobg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2mM9qMmNlEv3GNaqlQTKQMssYkdCVk+G1o/Wo1ps+qQ=;
        fh=xu45j7BxYw5s3nOW3iQoE9HEntjlfTFnKPZ0somiomc=;
        b=HsbrTscL7iTxQlBa+jBI5aqLQPZ9roKLCadZ7mV/QxnYD2GuoO3ZIsBT44Azcb74xx
         rR4OG2iCwh7COIFQSSZebKGkEIN/VRPkGZ23gW4Ps/9lIsGe/L97p9ZwrnJGfD3oMRg9
         llGiQyGH1vRa2Xpthh+A2s/SvKcElrB4dz90W4aE093CEbC1dsJHIgdJ11JN14SrRA/y
         c7wpKeJ/90zTEcb6WMLeERw0ry0zGGqw+UMoAfo6EotFIUcv/cDSF3egcpMqexSIhjvk
         UlK6cwN1IwUKudBLW00dEN6nswuuRHKQjNU1hYQWb3ursgGHGflNfSknV6TQHH38sSQF
         bWpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779058396; x=1779663196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mM9qMmNlEv3GNaqlQTKQMssYkdCVk+G1o/Wo1ps+qQ=;
        b=iwabBkpryb/tiBEc7gMiyMUXR7SMEltMlOWzBrIyXb4oN2UYBIhbDQzQswYwjPAuPm
         9WeeHJaJ1EElkDQKBgIe3aaOX+DHWKeU3YPUN2jNpsOW9SEAr2ewQ9DvwmEbnLck4Y/0
         o/uf128KMpUHIxl6tz4S7DLPlzrEyvQveSVONv/HKMdJ424Rn/cAAKUJp/FB8Jale6Tx
         QVDyNUnPNy+/EGl9iDFKd+s7T32L5Rk/7EFp2dBUjZb6L5S5gX4/XF5TXSGxcFxqL4GI
         F03R0NZ0ieZaZqntjJOIuya7GdrnHnQkTixsmivOmqzTCEmkRQrp5b2LtgiBX+SOsQ6w
         cyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779058396; x=1779663196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2mM9qMmNlEv3GNaqlQTKQMssYkdCVk+G1o/Wo1ps+qQ=;
        b=FITViO5h5paAWQpRHPjlzj+WHLUR8yFPar7x/YDBDIalVh5IWexoB95Pn/8Uogm9V/
         C77WFAWsMj/4R8Il1tWKC3NHyjmPZU1igbBvg8EuT6FuQca/CCRdBSeOMVBE+ZwpNWsC
         bH49zg/VXmzCaAVnFXwVH+2c8H8f6HuQ+ZC72O/RShBLJM45qA7g1y4PB+4wUUecYidM
         IFiHj55cIFaJJDvlb+dXZV3hgXZ5ya5XRBaDH0H7suCzBHYYEyi9nSrSrInKDjWzT52k
         6PeKwwtuuabvXLfEKTWdy4FlP9BIzaSSrbamLMbTdOvb4AQAkEfSbbo/NShYKSiM/r8R
         eHfA==
X-Forwarded-Encrypted: i=1; AFNElJ+bIYDTJVxBPjPo7XckYIlGh71PsiSRGC5rJ9/JP1zv0/PcXXboeZv5FsHXAHjJwM0MwXl7Qhn3I4eduW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO3I5w23siAtPDuRyosslFgP1+T+CxilYiYP2+EiMgrHEo8a1Z
	wCbv+DuZ7D3Y07UPTzjh8QzayX5/qi2KnA89ZVWoD7yNAuGn0nf817fUOe4w+zuNEKEMz5n5zGu
	7gtGPKA5urzBTyaEPPEeiG55UC4FD0b1SfhWl
X-Gm-Gg: Acq92OFPBOFr+UJMvZDGvyfy0lRTbLqdt7N0onv3Ro8jhzQJfzxJyt7KqV6+j+ddF9I
	FgcZ5EblDQVntI6GgCNtvmt4GzNbiXX2LwOiTbuMadEyZN0sCYpnIK7hXERql9BScVgMOzBrsy2
	EaOaSAeNF7HrDCfoTxhtaJj5EzbfiOn472z97fpZSaX5fKymyMmOrgJCHg7PsISN4XzySaNVsSH
	ebF9tM0vSHC1r3E4XV+sc/EoEZiwWX14LVu1kT2UdA5QSNBJLN6lFpBtQ0eMddjxkFGO0I+qn4Y
	BVveUqztUGgr/qGkgqnGkLlyikRpFzy6wueNhCHq6Dkm1+0k6PeT+tK0Xn/R3DA0O6AaZBnsY/p
	waG4z9f3eGf3+AkhCtnZHKqU=
X-Received: by 2002:a05:7300:dc14:b0:2e6:b55a:76ca with SMTP id
 5a478bee46e88-30397b88952mr2469266eec.0.1779058396471; Sun, 17 May 2026
 15:53:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com> <ba7ec52f-c4e9-4588-9484-dc8280d55593@gmail.com>
 <CANiq72k_tXGSCd1BEg8XmTr+acZHfdRbcFOVD7=O6yAbmv-nHw@mail.gmail.com> <f77a4858-2bcf-4bfb-95e0-24a5d91e0862@gmail.com>
In-Reply-To: <f77a4858-2bcf-4bfb-95e0-24a5d91e0862@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 18 May 2026 00:53:03 +0200
X-Gm-Features: AVHnY4KBxDsmrWmWB1r_5d-YCkKw_SSUFyDdSueLkpNJn3Kc6QzpiTKf-tfUDfI
Message-ID: <CANiq72mGTehUWS2-MgukOKmwAn3fB63boFNqbNENse6B00M7Zg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
	jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	qingfang.deng@linux.dev, yann.prono@telecomnancy.net, ej@inai.de, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 214F656436A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13210-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,linux-foundation.org,garyguo.net,arndb.de,linuxfoundation.org,lwn.net,linux.dev,telecomnancy.net,inai.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 10:25=E2=80=AFPM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> I was hoping for Linux to avoid the Rust trend of downloading tons
> of third-party crates, with all the supply-chain risks that entails.

I completely agree -- it is why I said a well-known, vetted set of crates.

That is, we should decide on e.g. a single CLI arg parser, a single
logger, etc. for most of our tools, and ideally they should be
well-known crates (ideally already trusted via use in the compiler
itself).

Moreover, they should be pinned with `--locked` or similar (like we
already recommend for `bindgen-cli`), so that we only ever use
something that matches the hash in the lockfile that would be
committed in the tree.

Cheers,
Miguel

