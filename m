Return-Path: <linux-kbuild+bounces-12615-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICpwGGeKzmlMoQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12615-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 17:25:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAB838B373
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 17:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 600F73016D0B
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 15:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724AF34404E;
	Thu,  2 Apr 2026 15:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gu3IvXdw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDDD342CA9;
	Thu,  2 Apr 2026 15:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775143266; cv=none; b=RDLfzazOX6+cSv3mZok9j/kepwYS47IZzc/LdEnuJSE2L8VX+c3WpBK34zBG6Sf4MJqN35AvwW2Pms3Xtr7C04FImQtJiW+Jvm14ZuSEJgIYGS5OwVitlJ4qq29xjKx3nHY2I/qNYgLO2ewY4i2lYuoXEacMGzoj9udh7p/ceOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775143266; c=relaxed/simple;
	bh=0lFWMO5jml7VrY1uSY2pOMPlyvy2I0NcVC1Z6fgxaYo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=sU3gGxhApJaonku3n7ZWK3jD8XRasFVGv1VdzTZieKHIMIaMN98U8HdNjOe82iV54yjn9dZ3oOsbBYQOp3HVjfffh7sLOCb6gB10A9ODsoFyXRNB0Aj1ksGf0lslUlW52kDtrEV0LyKdtnSPqomv2FkMLu4VaywEYx5BDrKEcDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gu3IvXdw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2142C19424;
	Thu,  2 Apr 2026 15:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775143265;
	bh=0lFWMO5jml7VrY1uSY2pOMPlyvy2I0NcVC1Z6fgxaYo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Gu3IvXdwpAqWMF/vHt7TpMSddimFkXtdbxU3p/ErWaEEWoJXnrqE3nri/Ob57OM9r
	 P2f1akW87iSrMmqKy+dO/wZEIW5I9MShp2R7I6JtkLqC5xUfZ1mzQl547n/0jQ6nWj
	 Oyh24jcIcRwUTdJHrdEPnyzECpVP6cPX9o6Ou76zNve/c4xOYpJHc88So2lpGiSjP2
	 dr9LKVN8H2rlpPoMVX60SQicD7LtFWHSqjKj8WYREIxiXxaz4vTb3xn4R8rHfCs/MR
	 9MrOIea1XdjVHZeFKbUwH/6Kq7VfMHFRniXT2Krf2DITUY5EdnBS3yW2gEMetI20jP
	 TPvzDmsxPoiUg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 1/2] rust: support overriding crate_name
From: Tamir Duberstein <tamird@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Carlos Llamas <cmllamas@google.com>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
In-Reply-To: <CAH5fLggZd4+zZxVeDUjfTUDbBFwrt8ZzK4pQV7KGrMZezYSpJQ@mail.gmail.com>
References: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com>
 <20260402-binder-crate-name-v4-1-ec3919b87909@google.com>
 <CA+tqQ4+gzV0vA+u-05b3gQfcFAdNchjZjC4Y+D1pBWhHGVuZqg@mail.gmail.com>
 <CAH5fLggZd4+zZxVeDUjfTUDbBFwrt8ZzK4pQV7KGrMZezYSpJQ@mail.gmail.com>
Date: Thu, 02 Apr 2026 11:21:02 -0400
Message-Id: <177514326247.29521.9370212115084243044.b4-reply@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187; i=tamird@kernel.org;
 h=from:subject:message-id; bh=0lFWMO5jml7VrY1uSY2pOMPlyvy2I0NcVC1Z6fgxaYo=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJnnOuMbjyjmXfy4aN3swCNr+V8bN3/7Ye/0fgdn4MMdv
 4LZzlvld0xkYRDjYrAUU2RJFD20Nz319h7ZzHfHYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdAx1jBi5OAZjqNXKMDOuEn5T/W7pr8YlrG7zOH3qWubOIf32i6GLGhEN5rCvUr7sy/JWQE90
 fnpV9ce4lvu/6a3eWng60K2abrXy98JrdDc6VYiwA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12615-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,garyguo.net,protonmail.com,umich.edu,linuxfoundation.org,google.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CDAB838B373
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-02 14:33:49+02:00, Alice Ryhl wrote:
> On Thu, Apr 2, 2026 at 2:23 PM Jesung Yang <y.j3ms.n@gmail.com> wrote:
> 
> > On Thu, Apr 2, 2026 at 10:55 AM Alice Ryhl <aliceryhl@google.com> wrote:
> > [...]
> >
> > Could you add type hints to `invoke_rustc` and `get_crate_name`? You can
> > run the following command to verify if it's all good:
> >
> > mypy --strict scripts/generate_rust_analyzer.py --python-version 3.9
> 
> This seems to work.
> 
> def invoke_rustc(args: List[str]) -> str:
>     return subprocess.check_output(
>         [os.environ["RUSTC"]] + args,
>         stdin=subprocess.DEVNULL,
>     ).decode('utf-8').strip()
> 
> and
> 
> def get_crate_name(path: pathlib.Path) -> str:
>     return invoke_rustc(["--print", "crate-name", str(path)])
> 
> Does that look ok to you? If so, perhaps Miguel can use these on apply?
> 
> > Once that's done, for the script part:
> >
> > Reviewed-by: Jesung Yang <y.jems.n@gmail.com>
> 
> Thanks!
> 
> Alice

With the above changes and after confirming `mypy --strict
scripts/generate_rust_analyzer.py --python-version 3.9` is happy:

Acked-by: Tamir Duberstein <tamird@kernel.org>


