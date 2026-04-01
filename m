Return-Path: <linux-kbuild+bounces-12574-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMEBCdSlzWmvfgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12574-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 01:10:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B72F9381704
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 01:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB2BE3062FA8
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 23:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349C148032C;
	Wed,  1 Apr 2026 23:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTmUdMFx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3A23F0A83;
	Wed,  1 Apr 2026 23:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775084461; cv=none; b=lw8R4csh5FIfXrCh/jE4UOQVqpCjeFa+NBwlQWBFPKSs4HPj5Wnki19iRbfcYtwdHM/jRbW1XCtgiSq6QaECGJWuU4SMEjlOMioNk0wQhQimXRkZo5Z6gWMQP1E5EF6u4EVtbUpcR9PC/D5vJAP9qZfLeftbwIHDc2S8obSBMLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775084461; c=relaxed/simple;
	bh=1OJuineu8PClHjPsG3fYTbGnqTeEga0zV2kTfSmawb4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=sa3MVwPaKt6idpmXkjQ/T8uWhGoSQXF5GlFbA4sjiWiorr1JW/Tl11ASnXzR3EL2rXJmSg3nYGbDcGgqU+DwXx5W4z/r/DRrmHw1gAjkR3GAT5xijy2GnSk8dtpHa22309X2HIPrzda9ABfryTS21g9MOFN+vmReaxz7edQ4BG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTmUdMFx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C13C2BCAF;
	Wed,  1 Apr 2026 23:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084461;
	bh=1OJuineu8PClHjPsG3fYTbGnqTeEga0zV2kTfSmawb4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=dTmUdMFxsYkxPmis09F9SPtnKde28cmwByv3QEYGqto19XeOKoBzECtJ/lACxN34o
	 88cXDP+3MbErZiAQc5mmtQiNg1UibFr5dZcsHtaVz7SACwXHa0Hz4qkUtgQ6Yj+mPJ
	 na3+ajNfZzKUWCzK7omgbHWSsEQLkWDQzNS0oDSRq40Fkh/Q3f8cakwVWBCC/hkOMN
	 lFx1nv4C5gF/8FZsKBZaRqQIaPHAqv/Ph8wIC9QGk4mAiJWsfqXJc5ra05aJUvmSG2
	 HkdNeJ7zsD0cgvxHfL7v26+nTHRtEd/OY/QYivMFyvEYSqf6Eastw5n6akb7nFjP3+
	 hpnbteA57SHZA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 20/33] rust: kbuild: remove unneeded old `allow`s for
 generated layout tests
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, 
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
In-Reply-To: <20260401114540.30108-21-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-21-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434460.73816.4231801886718165891.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=536; i=tamird@kernel.org;
 h=from:subject:message-id; bh=1OJuineu8PClHjPsG3fYTbGnqTeEga0zV2kTfSmawb4=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7v8ELVZvm0Ot+b2nHSn4DXRbVG6lwIVBPeIfpVdF
 WNTtDGsYyILgxgXg6WYIkui6KG96am398hmvjsOM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFTPOM7I8CSkokjo+uZ/i/c/aufXnXUv/2TrD5PYeo0MiXjP+Nj5kxgZ3u/emnr
 vtdKxsy1q5tqh4RX8Ap/yk8PKcre53zn59dIRPgA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12574-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B72F9381704
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 01 Apr 2026 13:45:27 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> The issue that required `allow`s for `cfg(test)` code generated by
> `bindgen` for layout testing was fixed back in `bindgen` 0.60.0 [1],
> so it could have been removed even before the version bump, but it does
> not hurt.

How about ordering this, the previous patch, and the next patch ahead of
the version bump to avoid the need to mention it here?

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

