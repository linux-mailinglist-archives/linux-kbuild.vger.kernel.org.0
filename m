Return-Path: <linux-kbuild+bounces-12088-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOsgKHDtvGmE4gIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12088-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 07:47:12 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDEA2D6525
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 07:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB5953062FB6
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 06:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C65355F32;
	Fri, 20 Mar 2026 06:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sXJx5TBE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3473D355F21
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 06:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773989229; cv=none; b=jMTpMmRopjBzDUwLltdzRB7S97/tWfgr7Pg24heltYYJD3NRwDCuWzm1gzlqE8Dy+Oz7CR8qYhw74DEnT2CRqW9K5lQfVNJD/KMIjs0zQzb0z9+wcfcU+/pD3kFjoKHUTEfk+XvxNTF+BERJbhBmyolUtk2V/8woxG4zFcO/Qcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773989229; c=relaxed/simple;
	bh=DTge4oFG/kkCzDL9D78XhdBGc/jpB86DZmFYvuj59Fc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Kc322IVWpD+k4z8uGVl5MbAxajcYgISCv9CRh7Dpq2aAl9puGVguMedbN5pJM8YhZrckoBBqB0r643yjtETFPRlUg8gMPIg5XBslh425qMW6HRMx/bioODSZYMKosnEANXolxM4rtPE73+JBkPGEe3x3yz27yspflU9OJJzH670=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sXJx5TBE; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43b3a675316so1338741f8f.0
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2026 23:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773989226; x=1774594026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTge4oFG/kkCzDL9D78XhdBGc/jpB86DZmFYvuj59Fc=;
        b=sXJx5TBE6Q0DXk2W5tbujB2dnvS8i6Pxak6lRiGPz2pkHjC+5E+Vv/DTKmex1EDruY
         bYd23mFUaahh/PPP+cyQMj0alihIL4/ErWNQpnEPuzIBf4y9rG2oF4/J5veBwIE3bzuZ
         zv4qBKVXfyeMOox2dbpwPep79iXBnJlm13v/jnWP91vdHLQslVnJeWBHe0tQHqKmOUVM
         NdNhCQI61bll8pWVT/2LAUoUxQtpmpZujshB2LWt9qWSIbmwm8vPJRqZw2x0E7Nu9eI6
         1TxsnoOeBnwFUl+alZp2QT6bVWwUyPwK92u6Z+tFf1XIWJyNkPFpfX5aM2G3YiFaoY/7
         DFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773989226; x=1774594026;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DTge4oFG/kkCzDL9D78XhdBGc/jpB86DZmFYvuj59Fc=;
        b=MOPE6U5NrOYrlm6c8Kfy7U4uqEo/Mj1jHlsRcbygkvtyJ35dmDz7EyT/kfCMybB3xN
         I9l1WW3rDE8zWyVFoTun3QTdzJ6nshu3tNrYUe4NC6YovDsb4YW0vGfK2iCWuIKyMKz+
         M1nQyfeeQXAe3TxWn9/UdJFoefUEg6uSk3SPlFoBhLz7CBZiFC/hPQM9dLgPIzTlC/0w
         NomGLq0csJc+FXAQpOV/5eEoVH8gsuv1qEy+7DuabmyWZmhVUZQNkmoU92ls3VBGeHlh
         NNfjce8WUkbEeDL6YorxdzgRCiYGWV9um4flDE5zZr9FaT93EY3IHcK4cKzku1C7jrNS
         IbAA==
X-Forwarded-Encrypted: i=1; AJvYcCWx84IxJw54jA1Xaj1/0oqA6IiFX5DDTsSQExTg1OYDgPWCcE7oXSL+/1hk2ogO0pVmHD4GUOlKRvk9pzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym7qCR18jA2iVL4wI4x9Is0r4ZoOMA9r8FFmQwq9agt+KVyTA/
	UvZlLhCMPoq/jKLzWsoyLAoOg17CXJX2ct/bN5Q+/ClEde4kIKXv3Dz+81Qp9hZVHYT0SVgjJmf
	h82qT+WFCgzkMzLrLxw==
X-Received: from wros16.prod.google.com ([2002:adf:ecd0:0:b0:439:be54:3d61])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:26d2:b0:43b:3d4f:e18d with SMTP id ffacd0b85a97d-43b64287044mr3201259f8f.39.1773989226281;
 Thu, 19 Mar 2026 23:47:06 -0700 (PDT)
Date: Fri, 20 Mar 2026 06:47:05 +0000
In-Reply-To: <20260319235443.GB769346@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260319-autofdo-v1-1-51ee2a7290cd@google.com>
 <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net> <CAH5fLggvkVvgP1pvBjNQ4XQz9=RtTTXhf0JCVDLfq-xX971D5g@mail.gmail.com>
 <DH6QGQDMPLDY.1H3RLPD1X8CGL@garyguo.net> <CAH5fLghkK76Od1AxSH_NgrxOr2pt2XOoVBuLD6ZovzcLoxNwQQ@mail.gmail.com>
 <DH6ZUW2WRTNM.3B6SWJS4I3DE4@garyguo.net> <20260319235443.GB769346@ax162>
Message-ID: <abztachY5pOvwM1Q@google.com>
Subject: Re: [PATCH] kbuild: rust: add AutoFDO support
From: Alice Ryhl <aliceryhl@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12088-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[garyguo.net,google.com,kernel.org,protonmail.com,umich.edu,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.828];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0CDEA2D6525
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 04:54:43PM -0700, Nathan Chancellor wrote:
> On Thu, Mar 19, 2026 at 07:09:22PM +0000, Gary Guo wrote:
> > On Thu Mar 19, 2026 at 4:33 PM GMT, Alice Ryhl wrote:
> > > On Thu, Mar 19, 2026 at 12:47=E2=80=AFPM Gary Guo <gary@garyguo.net> =
wrote:
> > >> On Thu Mar 19, 2026 at 11:44 AM GMT, Alice Ryhl wrote:
> > >> > Do you think it's worth having Rust not match the CFLAGS here?
> > >> >
> > >>
> > >> I think the C flags should probably be renamed AUTOFDO_LLVM too. Aft=
er call, all
> > >> the perf tools involved here are called llvm-foobar as well.
> > >
> > > But isn't it just called this because the config option is
> > > CONFIG_AUTOFDO_CLANG? So it's the CFLAGS or RUSTFLAGS related to that
> > > particular config option. It may make sense to rename
> > > CONFIG_AUTOFDO_CLANG to CONFIG_AUTOFDO, but that's out-of-scope for
> > > this change, in my opinion.
> >=20
> > I get that it's an existing config name, but previously it is a correct
> > description, while after this change it is no longer accurate.
> >=20
> > I don't know if there's an established practice on renaming CONFIG opti=
ons when
> > this sort thing happens though. Perhaps one way is to have add
> > CONFIG_AUTOFDO_CLANG that selects CONFIG_AUTOFDO.
>=20
> As Miguel mentioned, there is the transitional keyword for Kconfig to
> handle renames now but I would really like there to be a compelling
> reason for the rename other than LLVM is a little more accurate than
> CLANG. The kernel has never really done a great job of referring to
> Clang when it means the C compiler vs. the whole LLVM toolchain (like
> LTO_CLANG and all its derivatives should be LTO_LLVM since it requires
> ld.lld, llvm-nm, and llvm-ar in addition to clang). Additionally, aside
> from the configuration, there is the user facing Make variable
> CLANG_AUTOFDO_PROFILE that would presumably need to be changed for
> consistency.
>=20
> If we want to change the internal Kbuild variable names, I don't care as
> much about that.

How about we just call them:

* CFLAGS_AUTOFDO_CLANG
* RUSTFLAGS_AUTOFDO

then? For cflags, clarify that they are clang flags. For rustc, there is
no such distinction to make (yet).

Another option:
* CFLAGS_AUTOFDO_CLANG
* RUSTFLAGS_AUTOFDO_RUSTC

Alice

