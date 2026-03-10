Return-Path: <linux-kbuild+bounces-11785-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLTVAy5DsGlLhgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11785-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 17:13:34 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC47254655
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 17:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 228AC3169844
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 15:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71B63AF662;
	Tue, 10 Mar 2026 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fs0AlLQH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D7439C019;
	Tue, 10 Mar 2026 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773157522; cv=none; b=fmktnAG5EGpUdG/LubPQ+5zh1qqsZ4ruErt3OPa6TgvAmlfyoCEOuH9Tde6MovbpbTZoweOjcz7hqKeKVHOR0ZgZVMhtSmKbFmxwPQT7NxO9vTuE8voVbO4rH/v+trKVJkIAP17fTprhgnTByW4uPW1GmMJS5Pie61r2JZY/N4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773157522; c=relaxed/simple;
	bh=WAaHhyzoG5PZZQyATwfwHJX7fiydFxMz2tRgIzm86w8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=qOpALMkrUchAiAcNNMrpjugUiWz8QlpSEiXddwjJE4zmPmBkZRi5ydetIRDH868GAtw8INefKgpURZ0msNI75LuhmNAjv+kQnC/mhiPCT3JyXXv9CQWkGTah9Fk2pk1/OdzVuKjWYS5x4jJ1mq4pIPyohHrDk06eEcmc8FGs3r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fs0AlLQH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2590C19425;
	Tue, 10 Mar 2026 15:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773157522;
	bh=WAaHhyzoG5PZZQyATwfwHJX7fiydFxMz2tRgIzm86w8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Fs0AlLQHxOdvOz0IaWDyD9MmbmQ3m8vRJh1NciO7exglEA+Zi1SsY9F1lrjgGKquN
	 1tg9mQ9est/sETWfr+edU15T7ZIiESDvXFwrwdOvh2T/E5yaXvgATO96RRA4Pm2H4h
	 RfW/YCXMqDUM8IFfHsxXPqaqTlegLw2LQSDip0qyuUvgGfq/r5+nmycpaRm1Ab3tBK
	 O6qcQ1lrEAXo3Z7YWRprX8L1SFPyEEWERzQOsLIDmZcGFohBqZ28gz5d2d9ROK10LU
	 LBWx3+0mk0GhQ+7WIMPQ7if9jh/sZ2qFAGzzGC8djv6sedfZOsAFC0h+0fn/0WMALl
	 Ln2AURiLtuAdw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/2] rust: support overriding crate_name
From: Tamir Duberstein <tamird@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Jesung Yang <y.j3ms.n@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Carlos Llamas <cmllamas@google.com>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
In-Reply-To: <abAzTFLYsUxK7VJ6@google.com>
References: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com>
 <20260310-binder-crate-name-v2-1-0f7c97900d36@google.com>
 <abAzTFLYsUxK7VJ6@google.com>
Date: Tue, 10 Mar 2026 11:45:15 -0400
Message-Id: <177315751568.96522.7020199079773666163@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3705; i=tamird@kernel.org;
 h=from:subject:message-id; bh=WAaHhyzoG5PZZQyATwfwHJX7fiydFxMz2tRgIzm86w8=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJkbbHp2Ht1d1jrt3oEetes9qXzz9x0u3//ui1qmiuTuA
 i7jhycXd5SyMIhxMciKKbIkih7am556e49s5rvjMHNYmUCGMHBxCsBEymIY/sfHlcunPRFdwec1
 r6UjbseTmbxMkae2TZmivIe16bj4hDcM/9SaGIK++JcnGv9Mqt/O52f+K/AuX+7l2RVC65U1ijk
 /MQIA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
X-Rspamd-Queue-Id: 7DC47254655
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11785-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,linuxfoundation.org,google.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa:mid]
X-Rspamd-Action: no action

On 2026-03-10 15:05:48+00:00, Alice Ryhl wrote:
> On Tue, Mar 10, 2026 at 02:53:40PM +0000, Alice Ryhl wrote:
> 
> > Currently you cannot filter out the crate-name argument
> > RUSTFLAGS_REMOVE_stem.o because the Rust filter-out invocation does not
> > include that particular argument. Since --crate-name is an argument that
> > can't be passed multiple times, this means that it's currently not
> > possible to override the crate name. Thus, remove the --crate-name
> > argument for drivers. This allows them to override the crate name using
> > the #![crate_name] annotation.
> > 
> > The --crate-name argument is kept for the crates under rust/ for
> > simplicity and to avoid changing many of them by adding #![crate_name].
> > 
> > The rust analyzer script is updated to use rustc to obtain the crate
> > name of the driver crates, which picks up the right name when it is
> > configured via #![crate_name] or not.
> > 
> > Note that the crate name in the python script is not actually that
> > important - the only place where the name actually affects anything is
> > in the 'deps' array which specifies an index and name for each
> > dependency, and determines what that dependency is called in *this*
> > crate. (The same crate may be called different things in each
> > dependency.) Since driver crates are leaf crates, this doesn't apply and
> > the rustc invocation only affects the 'display_name' parameter.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  scripts/Makefile.build            | 1 -
> >  scripts/generate_rust_analyzer.py | 8 +++++++-
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index 32e209bc7985..adc3e2d1ac78 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -332,7 +332,6 @@ rust_common_cmd = \
> >  	-Zcrate-attr='feature($(rust_allowed_features))' \
> >  	-Zunstable-options --extern pin_init --extern kernel \
> >  	--crate-type rlib -L $(objtree)/rust/ \
> > -	--crate-name $(basename $(notdir $@)) \
> >  	--sysroot=/dev/null \
> >  	--out-dir $(dir $@) --emit=dep-info=$(depfile)
> >  
> > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
> > index f9b545104f21..d25bc3d7e719 100755
> > --- a/scripts/generate_rust_analyzer.py
> > +++ b/scripts/generate_rust_analyzer.py

Did you want me to take this part through rust-analyzer-next? There's a
significant rewrite there that adds type annotations to this file, so it
would be better if this patch could apply on top (with annotations).

> > @@ -194,6 +194,12 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
> >          except FileNotFoundError:
> >              return False
> >  
> > +    def get_crate_name(path):
> > +        return subprocess.check_output(
> > +            [os.environ["RUSTC"], "--print", "crate-name", path],
> > +            stdin=subprocess.DEVNULL,
> > +        ).decode('utf-8').strip()

It would be good to extract shelling out to rustc into a helper, now
that we have two instances of this pattern.

> > +
> >      # Then, the rest outside of `rust/`.
> >      #
> >      # We explicitly mention the top-level folders we want to cover.
> > @@ -212,7 +218,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
> >  
> >              logging.info("Adding %s", name)
> 
> Actually I guess we might want get_crate_name(path) here (or just path).
> But the other uses of 'name' should stay as-is.

It would probably be good to rename `name` to reduce some of this
confusion.


