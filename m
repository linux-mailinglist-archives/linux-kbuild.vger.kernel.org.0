Return-Path: <linux-kbuild+bounces-12701-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNSRKRJb1GlhtQcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12701-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 03:17:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C3D3A8A1C
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 03:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CAC53055803
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2026 01:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7363A1E1DF0;
	Tue,  7 Apr 2026 01:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGQ703As"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4211F5825
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Apr 2026 01:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775524523; cv=pass; b=LII+VQ9u9ikt8h5FeSB/0KnZRfsfZ6EoM1I8j7hMMlC1th6PrI95rMuymnjuV4C6R8FI5tLQUcgwNfwwI80JDJ7XDSKN1oVuV2HCx+cx8d1O44bELBYCL2OqiLlv8QoZKl7iAqNuKdQyafBa4M517jYjytYsToJrkERuHgg35mU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775524523; c=relaxed/simple;
	bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RIWbqUok76OdEh3d+RUcfxqaYxIf731uwoqACI8khm0y0InehNvsSnHFDKPGYd5JPD0ZDUhSYaA/D0FWE3q3B66rUWI/Y4U6o3jKUbDspB0dhEbvRZsRUvgdNeC6cr5T+7mil0cV4IVymBoRvJL0jAk6o2mIV8k45vw8PiMy37w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGQ703As; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2cc43ca447aso153370eec.1
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Apr 2026 18:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775524521; cv=none;
        d=google.com; s=arc-20240605;
        b=HGCg0ehSI2gcCiHcoxLObb/w5NDz+O5Hx/PeqSDzReZ2Dcc1RDipuweN3ECvTDGvil
         q+2Oy+CBGaECTt6gLrEkefa3C5Ff6rq/qfBYemF98HggBjf4Ccx3mRUqnONUuKyJTY3B
         9skUn2I99mlfBC6b2sBS6hks2MvncNfeAGw5oZlWIuTibibjpiAQ8qR4/fowBI+GFjuw
         kP+hOztIjBASdCoQestUliW97ZSrOZjzCNVY0wRBeTpq94SORDxfRCpgvFFxbOSBA2+m
         9t5BzEHOIqFUIMi1nFDShtRPEqVcTXv+7NsEgkfyuoWlLeyJpIJodEKQdbwdSntXLbrj
         VqPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        fh=xqJdth6MYbvs7m8aH7L6HgkggOWT/FLYZyvwmwN5T/g=;
        b=PcFVJfbxDg7+eVf3X5xuFTn2FRV5OkEj3m3PoY5MQMo+BMTMF44E+Kz682GBIAQAr/
         35dVfeShEvjELJ5ItnPKkaUvfp3pUR/7npR72uWr3JU230WdQJakE5MH2Njww8W4VP4r
         qNFfCC/wn/kW2xN/SMJI8sQQKvTtU7+GU0aQmQ6IrQnTMrKGvJ6vhJYYp9qOsq/hsuZ4
         W0lnXbpA2d+krssj7G1AsGO5hghMLQk1RDDilcWE9PJHNjv9qrBfNhXB/TP8ZVQTScHX
         CJJELsq48ljBoMwzc2cVRPLxWk6Ke041xpV4XNSBFvMh/ggBkzjU/6aD36L8/AiF1SFC
         VzoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775524521; x=1776129321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        b=YGQ703AsCty0gWvo5XnlPxhjc5LCMeOjJ+5VaBNrHpu+0TsSyjrNcWEWd/m0xKLvux
         Fz5M7QK2bIoG18YbdIV5pRHLUt0VRJlRNL3J2rM62DhKJfRPvZiTpFS5LoAtuErROO2A
         i5cq6rZGi0/DoY6biOvoAPYi8iZftts1ZmtoQjeEvt3xZ+dK0jCer/1bDx9ZChZ+Zp0s
         7rRkWYB/dNzrdFZyyERvo07rZGCl1n5PabJoeFVP4Vr7eDLp+plO3A1tRXMKwwL0NCB4
         seVG8RH8bxEcUVp89x1xzYmOL6jQnuRQvt7t2bQgN7B7U8eQ6d27Ci+Z9zrMJMknNpl6
         Tbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775524521; x=1776129321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C6sODPPjnlrZIOKdwziurbw8hAdqBwTpglq0vQMQ05A=;
        b=swx9VUfoCLraHvd3PWvfAwvmTpS0auoswNTAvAHDn1tkqGYQ3hWulWRU2rXWvduF0f
         o+Z45I1gzGxjzfoNCvIlo0HykNrxKyMNLqk/Bw/hXqz2Vu19h7WPq8hoJgUe8pfFH19H
         jev8ce/mpAOfH0njc8ogt2PTD0QwrTjRrVTILQQCvwt5YzqxtDoU7zDEbYjh3X/ub9W3
         nFcfHverrs8xZiWl7jjpwodizy6MW9xjKr9fqKXJ8S+HCWLyJOJIrJbq2resl798JFxK
         +VFZV287aR6t+MDCTFDTielcWfnyAWbIR03Pgj+XRHIX2OYCpuzXee3KCGDT4m16o10y
         accQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+lMQ3XszrvZGgvspsU3vK6eQ6lkwhIQeXsIMUehg14BEeQcRKugZrnpS5IzwA1njWEgY6yCAl0AElIE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHd3Y5lFrbT50s0LLsP7a9RAZO/vageI2R9ckMplKkL/CD4uYY
	8iBB/CVOTjU8r9VNPpTkNYf7WpkDkk1219S/GIMx1wj5NdtZja4vnYhJAOq+6RhMvoA41SCoSvi
	voB+L2KEJAMb/4taEMTmqAXDPV5j+LEo=
X-Gm-Gg: AeBDieukdwS2JX9HZewLzWOO1Us0gSMj5HfNy9GCVeggPan7i5oe4ihyCGm5GzMd/vU
	se9vpZKNIDbSxH6V26LovRplNb2q/YrrOsPekWLH3gA8gWIMAuDGHQjGE/kyKACuyp3PY0lmHFp
	nnzqUd3E3sBUpSCrgsyHrpD71zyy3zF9hnBmqHHBhnEAMjSbR3KpZPh8YNgncm0YKxghtL7Qbdq
	SZdinDRAHqh2/NFw3Q0UU3q58SW+Yff1AHBh5GwEu9oJB1sA5s1EqnxlIqDIgCZoiaeNsp+yUHX
	4B2UQfPVZC0RtFwFsV99UZF5XPQpURkO7ssAS3z3Zggui+NxGOy47r5E625DBGIesUwfM/MZAVo
	+kFitK5AzQEqR5GYaWT/OUjA=
X-Received: by 2002:a05:7301:1007:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2cbfcf52a13mr3516734eec.3.1775524521173; Mon, 06 Apr 2026
 18:15:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
 <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com> <CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com>
 <efe61810-2b28-4acd-b69f-d577042c0b62@nvidia.com>
In-Reply-To: <efe61810-2b28-4acd-b69f-d577042c0b62@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 03:15:06 +0200
X-Gm-Features: AQROBzCpjGVGSHiqD6WWW0AkLWSnE3ic7jf8UnYoPnV_5tut3XVgaNfJWwQj0o4
Message-ID: <CANiq72n84On9UxQ9CNqyFb5wpJZKrBzb1Xej9ZRqhLim--ftAQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12701-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 04C3D3A8A1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 6, 2026 at 9:07=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> That's what I thought I recalled, too. Weird that it is not in rust-next
> already, though.

It is normal -- in the kernel back merges are generally to be avoided.

Cheers,
Miguel

