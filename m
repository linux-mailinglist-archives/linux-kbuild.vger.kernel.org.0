Return-Path: <linux-kbuild+bounces-13800-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M75hC/34Mmqp8AUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13800-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 21:43:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4D869C347
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 21:43:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=A4Kdz6vW;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13800-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13800-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFC7030F7213
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 19:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B792738B7AA;
	Wed, 17 Jun 2026 19:41:09 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395D438B7D9;
	Wed, 17 Jun 2026 19:41:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781725269; cv=none; b=Qo1eJfUioFpE/PPsAh47PAG/CZfubK8n0go4gNh1FqVezx0BUIN/an9TTXvCGuWYPQZlQts5DF0WmofIW/n54Qc35WtKW3o2Vd5dTow6qooL4R9NXW7LQOcS7oReueuBflsXryfNTc9FE2KtD18ihvZSOtQDFgRRC8SgpUqM9oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781725269; c=relaxed/simple;
	bh=qfykWwOUu/ivugFSHe9XrwcsBop38fwcdbGCH8Y+oFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ipglDd6ofTMS4yATUk9+nJapPw/02Dg/8onJzXvhRjWBGTxDIqBUCEAjTIuOtHSG4RK+Z9dThmyKSD77U/nBrm/sg/01giA5911w2quEx0dbjpchE+majdy4xfMGW2df/NcTHSiM/7Gjr1sCsxIdsVO8DGAkEnlas6IVdkLAKn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A4Kdz6vW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 577D61F000E9;
	Wed, 17 Jun 2026 19:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781725267;
	bh=yB3SrqMet3Fr/xkbHMXKRnsL+LEh/h0Mxg/9ZOQwj0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A4Kdz6vWBW+AJjv/Bi0LAOdWUT9EwBi6++FBDlHAaUi2tYEmXT4uKTMrFot9gcKga
	 HwlFgiYYNP7e+0n9HYFlnRDDUUGWhuXA02o1ji66tOqY2JLQRG47v5OnZZmNfpE35l
	 ZBVso3Nh7BojRncAK9A6jIFegR2uG/MZHHrHb18QFtCTHYPso93/0HUsDjqZ1tSLgW
	 8HWpO3Sal32Xqm15FkvwGI80ua+h9exkxQtnxhJzH0e57qRlFPLRXn1wIEVkkEWz3I
	 2ARKYa7WCwtvn0DkUxGpOeIVNLsei7fFCbaVO3P3DdGGKBNYeSssodt6ZsKYO6m9mT
	 uJUJ5Q+b2z0AQ==
Date: Wed, 17 Jun 2026 21:40:20 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Mohamad Alsadhan <mo@sdhn.cc>, Nathan Chancellor <nathan@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Yoann Congal <yoann.congal@smile.fr>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8] kbuild: host: use single executable for rustc -C
 linker
Message-ID: <ajL4JBIUVHdYISsX@levanger>
Mail-Followup-To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Mohamad Alsadhan <mo@sdhn.cc>,
	Nathan Chancellor <nathan@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Yoann Congal <yoann.congal@smile.fr>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260509101939.27108-1-mo@sdhn.cc>
 <CANiq72=p+NG_JRuDBJPPtN2QkmFGJ0BuFNMWnQ=Vg+v8x9+0yg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=p+NG_JRuDBJPPtN2QkmFGJ0BuFNMWnQ=Vg+v8x9+0yg@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:mo@sdhn.cc,m:nathan@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:yoann.congal@smile.fr,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13800-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[sdhn.cc,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,smile.fr,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,sdhn.cc:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D4D869C347

On Wed, Jun 10, 2026 at 03:18:54PM +0200, Miguel Ojeda wrote:
> On Sat, May 9, 2026 at 12:20 PM Mohamad Alsadhan <mo@sdhn.cc> wrote:
> >
> > rustc's -C linker= option expects a single executable path. When
> > HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
> > `-Clinker=$(HOSTCC)` results in the shell splitting the value into
> > multiple words, and rustc interprets the additional word as an
> > input filename:
> 
> I have been taking a look at this, and considered applying it since
> Kbuild is OK with it (thanks a lot for all the work during the
> different versions), but I am not sure if the following bits are all
> intended:
> 
>   - Shouldn't `HOSTRUSTC_LD` be documented in `Documentation/kbuild/kbuild.rst`?

Good catch, thanks.  Yes.


>   - Why do we do both `clean-files` and `CLEAN_FILES`?
> 
>     + In fact, should we do it on `clean` or `mrproper`? Nicolas
> originally suggested `MRPROPER_FILES`, but this is on `CLEAN_FILES`.
> But more on that below, since I guess it depends on how we treat
> out-of-tree modules...
> 
>   - Was this tested with an out-of-tree module? I am asking because:
> 
>     + It does create an unused wrapper in a `scripts/` folder in the
> out-of-tree module directory (i.e. the one used is the in-tree one) --
> is that intended?
> 
>     + If we remove the wrapper during `clean` as the patch currently
> does, then it means we cannot build Rust host programs in an
> out-of-tree module (because it uses the in-tree one). Should it be in
> `mrproper` instead, or should we generate a per-out-of-tree-module
> one?
> 
>       While I think the kernel generally expects that the same
> toolchain is used for both the main build and out-of-tree modules (it
> may happen to work otherwise, but as a policy it is not supposed to be
> supported, or at least that is what I recall I was told), I am not
> sure if it applies to host programs. I guess someone may want to use a
> different host toolchain vs. the one used to build the main kernel,
> and I guess things would generally work.
>
>   - The `filechk` could fail if we use Rust host programs in more
> folders later on, i.e. if two submakes run it at the same time, and
> one at the end deletes the (shared) temporary, then the other will
> fail if it was in the middle of updating it.


Uh, thanks for all those good questions.  I didn't even think about rust
host progs being built in out-of-tree module trees.  And the concurrent
filechk calls are really no good.


Iff HOSTRUSTC_LD shall be kept stable for external kernel modules, a
semi-simple solution might be to move rustc-wrapper rules to
scripts/basic/ and use cmd_* instead of filechk.  Regarding the
queations above, this would mean:


  * ${KBUILD_OUTPUT}/scripts/basic/rustc-wrapper will be purged during
    'mrproper'

  * It will be generated only once, no matter who many in-tree folder
    use it.


Only roughly tested:


diff --git a/Makefile b/Makefile
index 8235b6a9b3cc..e3a82c344e69 100644
--- a/Makefile
+++ b/Makefile
@@ -661,6 +661,7 @@ export RCS_FIND_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o    \
 PHONY += scripts_basic
 scripts_basic: KBUILD_HOSTCFLAGS := $(KBUILD_HOSTCFLAGS)
 scripts_basic: KBUILD_HOSTLDFLAGS := $(KBUILD_HOSTLDFLAGS)
+scripts_basic: HOSTRUSTC_LD := $(HOSTRUSTC_LD)
 scripts_basic:
 	$(Q)$(MAKE) $(build)=scripts/basic
 
diff --git a/rust/Makefile b/rust/Makefile
index 2fbdebb93bf2..d02002c50432 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -593,7 +593,7 @@ quiet_cmd_rustc_procmacro = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET))
       cmd_rustc_procmacro = \
 	$(rustc_target_envs) \
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) $(rust_common_flags) $(rustc_target_flags) \
-		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
+		-Clinker-flavor=gcc -Clinker=$(objtree)/scripts/basic/rustc-wrapper \
 		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
 		--crate-type proc-macro -L$(objtree)/$(obj) \
@@ -610,12 +610,14 @@ $(obj)/$(libzerocopy_derive_name): $(src)/zerocopy-derive/lib.rs $(obj)/libproc_
 $(obj)/$(libmacros_name): private rustc_target_flags = \
     --extern proc_macro2 --extern quote --extern syn
 $(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
-    $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
+    $(obj)/libquote.rlib $(obj)/libsyn.rlib \
+    scripts/basic/rustc-wrapper FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 $(obj)/$(libpin_init_internal_name): private rustc_target_flags = $(pin_init_internal-flags)
 $(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs \
-    $(obj)/libproc_macro2.rlib $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
+    $(obj)/libproc_macro2.rlib $(obj)/libquote.rlib $(obj)/libsyn.rlib \
+    scripts/basic/rustc-wrapper FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 # `rustc` requires `-Zunstable-options` to use custom target specifications
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index c1dedf646a39..0be405efa38a 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -91,7 +91,8 @@ hostcxx_flags  = -Wp,-MMD,$(depfile) \
 # current working directory, which may be not accessible in the out-of-tree
 # modules case.
 hostrust_flags = --out-dir $(dir $@) --emit=dep-info=$(depfile) \
-		 -Clinker-flavor=gcc -Clinker=$(HOSTCC) \
+		 -Clinker-flavor=gcc \
+		 -Clinker=$(objtree)/scripts/basic/rustc-wrapper \
 		 -Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
                  $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
                  $(HOSTRUSTFLAGS_$(target-stem))
@@ -153,7 +154,7 @@ $(host-cxxobjs): $(obj)/%.o: $(obj)/%.cc FORCE
 quiet_cmd_host-rust	= HOSTRUSTC $@
       cmd_host-rust	= \
 	$(HOSTRUSTC) $(hostrust_flags) --emit=link=$@ $<
-$(host-rust): $(obj)/%: $(src)/%.rs FORCE
+$(host-rust): $(obj)/%: $(src)/%.rs scripts/basic/rustc-wrapper FORCE
 	+$(call if_changed_dep,host-rust)
 
 targets += $(host-csingle) $(host-cmulti) $(host-cobjs) \
diff --git a/scripts/basic/.gitignore b/scripts/basic/.gitignore
index 07c195f605a1..d314c04fe131 100644
--- a/scripts/basic/.gitignore
+++ b/scripts/basic/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 /fixdep
 /randstruct.seed
+/rustc-wrapper
diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
index fb8e2c38fbc7..0aec1adc199b 100644
--- a/scripts/basic/Makefile
+++ b/scripts/basic/Makefile
@@ -19,3 +19,25 @@ always-$(CONFIG_RANDSTRUCT) += randstruct.seed
 $(obj)/../../include/generated/integer-wrap.h: $(srctree)/scripts/integer-wrap-ignore.scl FORCE
 	$(call if_changed,touch)
 always-$(CONFIG_UBSAN_INTEGER_WRAP) += ../../include/generated/integer-wrap.h
+
+# rustc-wrapper: rustc's `-Clinker=` expects a single executable path, not a
+# command line.  `HOSTCC` may be a multi-word command when wrapped (e.g.
+# "ccache gcc"), which would otherwise be split by the shell and mis-parsed by
+# rustc.  To work around this, we generate a script that invokes `HOSTRUSTC_LD`
+# with the linker arguments appended so such commands can be used safely.
+#
+# Set `HOSTRUSTC_LD` for a different rustc linker command than `HOSTCC`
+HOSTRUSTC_LD ?= $(HOSTCC)
+
+quiet_cmd_rustc-wrapper = GEN     $@
+      cmd_rustc-wrapper = \
+	      printf '%s\n' '\#!/bin/sh' '$(addsuffix $(space),$(HOSTRUSTC_LD))"$$@"' >$@; \
+	      chmod a+x $@
+
+$(obj)/rustc-wrapper: FORCE
+	$(call if_changed,rustc-wrapper)
+
+always-$(CONFIG_RUST) += rustc-wrapper
+ifneq ($(CONFIG_RUST),)
+targets += rustc-wrapper
+endif


-- 
Nicolas

