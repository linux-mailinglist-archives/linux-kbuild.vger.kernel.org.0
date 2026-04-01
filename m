Return-Path: <linux-kbuild+bounces-12544-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNWVLDVYzWk5cAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12544-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 19:39:01 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A29A37EBC9
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 19:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D21233015D14
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 17:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AF147D94E;
	Wed,  1 Apr 2026 17:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m47/sJ8V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3991446AF3C
	for <linux-kbuild@vger.kernel.org>; Wed,  1 Apr 2026 17:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065000; cv=pass; b=hUfO9Slps5CjMIo13v7luIs9mPxJRBbOJ+IkUBbnRqJs8hWVy2RZl2Aq37A4KWWBnX+nhv7MdRE3Om+rvt3MHJiOLsZ9axs3zEKSOu6kpshMfvccp/FYuNM546JSZGCiXwqLNqZwELaEjOvm4HdPbE5iM/BZlCao5nKrOfS/jk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065000; c=relaxed/simple;
	bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWZC0YERdfOJ13u4gPXlFLbijEK7ujvnCzxGV4/aJRrRLUqUeagUYVeDzdcq93mAUmc/pAvcqX7Bv1PPdvCTfbiWr4deHc01m7XrBgIcTRh+rWNprkYjvUzhwCI/hdFkhrN4lUdB6MyrtUWx42KZMiKBPWZg2C3BN5dluTRtdeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m47/sJ8V; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-127148c2112so7691c88.3
        for <linux-kbuild@vger.kernel.org>; Wed, 01 Apr 2026 10:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775064998; cv=none;
        d=google.com; s=arc-20240605;
        b=dKCAemaNhBveOCTuLgZa+UdbxzvDabee57WQMjBug7G3MzIu5d5glo8go9kQJMWie8
         tgerkJSInoKxsbh9PmCVXkWYIEKt1VR5GkeHGrBT5WjiaQCgaEyHKA/aUChliS4ulk/H
         088YXx+xPU1pWuix9T080z7XrYvlo04BB6YRlc6GfaLt/6qZSfcnhU0QOCDyW+UQs30w
         f3ck+DT6vP7z/x6GF+aapzmnWMZc3/8R8uHzIn0f/Qtzb140o5Oe4unSrBRqOanCWNf8
         GamIebdPLUskOQV/Sc6ztoPWdCiSYIG+3EqVkWd3MhzcaxZ3Xi/GdjuyDc9/Q6npKm7w
         xF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        fh=cUOqhAVH3Wo8aSEksAx7zXq1TvH7ww2FhU1cNJeZQxw=;
        b=WAYD/lTVyOUPSoL4oP8q+j4gQy/SJuDbl3DU4HXwz8xs+sLviedJXLykUz7CClBE7I
         W3eIlh+1x1PA9YSiFvFI9MFJdiw6CnJPtKUw/mcfUpHWx9XAEZh6vZPxJSY9v4KjrkZD
         WUm88x4c+XomoUJj7LABjQnM8IqiM8BUYn1JdC0+KY+2tp19uXKEbtBrTBwSJRCCg20S
         UWahWQ6N68Gt+N1XWSAP4Sbo94mxjxYYVOSxwekUDGKxO4B1U2NMvCQWfn57PCAX/TRh
         ERqC00A9lw5w/0/krY66oaRyD9TTUGXiA87qryKpaqjhVKFpy6mAY+/B4f2wb9nREvLZ
         PHfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775064998; x=1775669798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        b=m47/sJ8VF5zmkEbgvymxRwXRqMU1Z/SMQ1njp0gn1sBAbbZeHHcDZwn9Ov5QCfkASU
         IYCyXdshryWiChJCSKlCTLKnWq+cjV+SueJ0RS1kudCFliXnb1YcC/VNmS/glt0Ym+18
         i/hh7HaxM41rZ4fLKiMBtU+DCN5UMWtHllNzl0Lq2ZOhVCOgWKY9f3iMAc/ckyFgm2bC
         phA0/vIEnZ/8ZF/59f6s1sC6QR0J1Nfm78sLyH4nFLXJ5D/XhZh3PjfHWL6vp/vFlaYb
         FqY/DKSgpkqYWCMJ9Pt96U66Bk6BJy9seltRXj/JzBJfl/oFXs38w7bGYUrJGgoyxxWP
         wbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775064998; x=1775669798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Madpyzu+7zvyLSmbgHorRXu83g1kA3bqkxQ/QKvvzXA=;
        b=tAIDCFoa3EaMEtplJXQS8BGKAdJOgbPqhBOW8HDFQQ4MdUu6R8cAyR4v+2IHysouo8
         4ORnBsFxXmllMPAcpyRUESnWAazvl7oc1WePu45fN/Vzrzh+batJWusDdKAhQx7wAvQW
         SEUlckO7aUW703c5IwlKm8+VobQAjp5DQ1MysVh216w8aXe3ZaZsGtC+61Eiq4GglI75
         QNa6FosZrP6H9TXidJQJSpn4oize5c5LObJQbe9lYL/Yv131Y1yLf2lcQYTD62PFUQj4
         fqsn9Ef0BP28GuP8x/BhTI59J+Ndx/kV3VHEwqSM7q2lgS72fIf52P1n69a3GanUh0B+
         VuJw==
X-Forwarded-Encrypted: i=1; AJvYcCW8yKCMpUliHTvl88RcbsQ553S72WWao4ps5N8a2NKAWar3RAfw2ByE1hIK+Jfo25mJYfYoj1s/OOlvt8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXzgZEdfRLGFrtTtrRcwsWJS4n2mMXE24U6YhZTNC5p9JDpWH/
	2c5fUe1EGLCP0rgDIXlOF2I63fBINu0maZ7OHWtjP6aoV8pC1q8v/wtuoInGZwjxHtvxOfa1KOF
	vZOwXZKccRY9qKqjYrcAYDM5fphIAxeA=
X-Gm-Gg: ATEYQzw+H7mVGxcIJiW2Vkca26TIWZG7x+N/cCuVLejkl0NoDD1IlZcYBQl3vyNbFip
	z/shCrT9kmecqHkOYfUQE62nC0cYu7w3E1TSrq1J9LKTSPnDzUiOhWk2vx3O7HuI35xL8ZITcLT
	5G3gYSgowVLlAPCcRzZc/6MvsQNXtlvR/0YD7tHheR6Ux4Ap/PmXL6AZAjy+jedG/+4t54/zRYF
	Qk+uGvdDvWjw/a/gy00Fi2cTf7BhGOBeciUQs1X4LqKAksKO6srT0OSM7YwavmR4aNv5TetpvmT
	tOMacxxkxuxipZHcyAI34OH94Kig9jtaC/CG2cXcdcP3pyEqXvAtjRTfJ/+gCrA9Qst5U1ISDPa
	uw9oQ+7TWiyZhghUJAdiZBRI=
X-Received: by 2002:a05:693c:2c97:b0:2c7:2cac:8162 with SMTP id
 5a478bee46e88-2c9326aa500mr1010168eec.5.1775064998156; Wed, 01 Apr 2026
 10:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-9-ojeda@kernel.org>
 <DHHVEPJHLGDW.1E6KDP9BUFG5U@garyguo.net>
In-Reply-To: <DHHVEPJHLGDW.1E6KDP9BUFG5U@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:36:25 +0200
X-Gm-Features: AQROBzBeO_yfCUmMruxpBPrHPRt9Z-RBtWsQqT4MIRVUyc-eOkOj6bAx0WG8aNs
Message-ID: <CANiq72mnnro6UD3SYgTOG+kipwkTBvbEAGH+jXUa3kLTUNje2A@mail.gmail.com>
Subject: Re: [PATCH 08/33] rust: kbuild: simplify `--remap-path-prefix` workaround
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12544-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3A29A37EBC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 1, 2026 at 3:59=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I'm not sure that I parse this. You do remove the filter-out completely b=
elow?

(I see you saw the other commit)

> Looks like this is going to conflict with rust-fixes (which adds the
> --remap-path-scope). Perhaps worth doing a back merge?

It would be only a couple lines conflicting, so it should be fine.

Having said that, when I was doing this, I wondered if we should even
consider keeping the workaround. In other words, locally for
`rust-next`, the "normal" commit would be to remove the workaround
entirely because there the flag doesn't exist to begin with (i.e. the
workaround should have been removed back when the revert landed).

Then, when conflict happens in linux-next, we can just keep the
addition of the flag from your commit -- the rest can say as-is, i.e.
no workaround needed, because you only enable both flags in a version
(1.95.0) where there is no need for the workaround (which was for <
1.87.0).

It is also why I added the second commit here, i.e. the "make it
conditional", because I was testing that indeed we didn't need the
workaround anymore.

So it may just simpler to do that. What I thought was that perhaps the
workaround is good even if we ourselves don't pass the flag, e.g.
someone else may be passing it. But the chances are very low,
restricted to a couple versions, and the error is obvious and at build
time anyway.

Cheers,
Miguel

