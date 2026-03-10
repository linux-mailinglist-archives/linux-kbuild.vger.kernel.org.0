Return-Path: <linux-kbuild+bounces-11783-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMrmLus5sGlbhQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11783-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 16:34:03 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 178B7253A0A
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 16:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 42E2432ABCFE
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 15:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257A930C37E;
	Tue, 10 Mar 2026 15:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VdVlua1W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D1E3033F6
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 15:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155153; cv=none; b=M8RI8MdTJ1alCiJ73Mj+4towaeP3yGfs8wG4pJ1s7IoTxK0TssqDUQoYtBwvW1Wh2j4B+4+xturcEkt4uCS++HU3mk6NHrQFFvtmwwzz3RrZ1a1WpSX59kOfXniyEYAmD/rwxojzCyF81Wp7pa+tTAShLBIpPP2EWfISJDky1hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155153; c=relaxed/simple;
	bh=kV2wthUv/leJEQaKnb8eax2EBP7m+sPs2WFTinmX030=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t+Qqs3exJ+qRRERYVFZ/dJzOP/30oe4uRMV4A86YaGmCt2Swi86EFDMUhB1C8xK2uDSQkElz5QHIcCm6PTlWoiKqK9KbFhQblXy7lExAlAL/9xs3NEBKn/eP3eKUB7GkMBzCgRTI244ZdMhl8vGLjSQ8b+tddxC+jm63TtAjm2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VdVlua1W; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-439cbc5fb4fso6444619f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 08:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773155150; x=1773759950; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vRxINOztuTcq0M9mN6wXIb/1VY10+tkVrmyaxf8pT10=;
        b=VdVlua1WwUZ/emAkcovxKyO6hx27+ltbRYk5IA60+je8fbxKZsAm5JfRIdGsxGgEhi
         JYj7JWd/4tmHspafyUFRH6g/TukgxxqFiWkZjtgPLjMtxN4+TUcUZSYI05+o1Ncz0WMx
         C+IJS8Cu02MIV3/39501RZjNxF2j+WZ01ADd9dL5wbF/MM/C7XWka1fzLGjP0j2/MmvG
         N/UiOQZxyBjNe96+FjzMotw7sWbnve/+RkyAxQDu1Nl6taw1MbFkKP1UhN2M7v8Q25eU
         MScVjL4KE56wLBaSb3qhJXg1MET99r0xSATOlLK2NkvJ08X3xRRd7lzTI+BaGU+iFunT
         Tl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155150; x=1773759950;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vRxINOztuTcq0M9mN6wXIb/1VY10+tkVrmyaxf8pT10=;
        b=C28sdHSip2+734oVpnsrpdk0rhUh11rpuhE42Wf3p+ocQA0lt5hIpByqb6vejG2htd
         Avw3HqnlHCCVivQ9nt+etZSzQP5hoPKLmm/f7ojittQ+jLFwhGyr+RM4PMr+0R8tgf4w
         Dlu8/dhUF5ZawaRo1H94Y0nxGsubdugOVMIxFNwOK2giiMMvzDxssVw18nnvtxcb7OiW
         i6aDkwFeOqQcODNOi0MjA4lOw1zBS2cMhS/UmVP1bS5dzpcfPr1oxBEZHmJPYYSDBycU
         Qa1jT+NTI8XxAxHxGSdPwYW1TLrEY5YPcW86sKyofOgLblfsrKZkUi5PE0tc++UTTody
         Lt2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2uAkLoV4o7IFJdOoDEHU5IK9JXfLgsvstte/j0TEGhKd0WhCK/Jb3jM+vkbClOSLmAlhrNJ10nlzdOMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Ajnaq3YVijX9Kiq9Ki64m9Gs5V6ttNpHzh3UYlM6vyHK2vBo
	imYwq3MTTRBSBNV7ThCWtNvC1IMF9oBdzxR6Gr7PixpYrL2jQBW7Rcv7MwHUp82OrNbIZtp2aa+
	1PC79ysZA8tf+821gew==
X-Received: from wrol10.prod.google.com ([2002:adf:f48a:0:b0:439:ba70:3167])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40dc:b0:439:c9d0:5fc2 with SMTP id ffacd0b85a97d-439da891b2cmr26419385f8f.39.1773155149903;
 Tue, 10 Mar 2026 08:05:49 -0700 (PDT)
Date: Tue, 10 Mar 2026 15:05:48 +0000
In-Reply-To: <20260310-binder-crate-name-v2-1-0f7c97900d36@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com> <20260310-binder-crate-name-v2-1-0f7c97900d36@google.com>
Message-ID: <abAzTFLYsUxK7VJ6@google.com>
Subject: Re: [PATCH v2 1/2] rust: support overriding crate_name
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 178B7253A0A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11783-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,linuxfoundation.org,google.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 02:53:40PM +0000, Alice Ryhl wrote:
> Currently you cannot filter out the crate-name argument
> RUSTFLAGS_REMOVE_stem.o because the Rust filter-out invocation does not
> include that particular argument. Since --crate-name is an argument that
> can't be passed multiple times, this means that it's currently not
> possible to override the crate name. Thus, remove the --crate-name
> argument for drivers. This allows them to override the crate name using
> the #![crate_name] annotation.
> 
> The --crate-name argument is kept for the crates under rust/ for
> simplicity and to avoid changing many of them by adding #![crate_name].
> 
> The rust analyzer script is updated to use rustc to obtain the crate
> name of the driver crates, which picks up the right name when it is
> configured via #![crate_name] or not.
> 
> Note that the crate name in the python script is not actually that
> important - the only place where the name actually affects anything is
> in the 'deps' array which specifies an index and name for each
> dependency, and determines what that dependency is called in *this*
> crate. (The same crate may be called different things in each
> dependency.) Since driver crates are leaf crates, this doesn't apply and
> the rustc invocation only affects the 'display_name' parameter.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  scripts/Makefile.build            | 1 -
>  scripts/generate_rust_analyzer.py | 8 +++++++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 32e209bc7985..adc3e2d1ac78 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -332,7 +332,6 @@ rust_common_cmd = \
>  	-Zcrate-attr='feature($(rust_allowed_features))' \
>  	-Zunstable-options --extern pin_init --extern kernel \
>  	--crate-type rlib -L $(objtree)/rust/ \
> -	--crate-name $(basename $(notdir $@)) \
>  	--sysroot=/dev/null \
>  	--out-dir $(dir $@) --emit=dep-info=$(depfile)
>  
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
> index f9b545104f21..d25bc3d7e719 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -194,6 +194,12 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
>          except FileNotFoundError:
>              return False
>  
> +    def get_crate_name(path):
> +        return subprocess.check_output(
> +            [os.environ["RUSTC"], "--print", "crate-name", path],
> +            stdin=subprocess.DEVNULL,
> +        ).decode('utf-8').strip()
> +
>      # Then, the rest outside of `rust/`.
>      #
>      # We explicitly mention the top-level folders we want to cover.
> @@ -212,7 +218,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
>  
>              logging.info("Adding %s", name)

Actually I guess we might want get_crate_name(path) here (or just path).
But the other uses of 'name' should stay as-is.

>              append_crate(
> -                name,
> +                get_crate_name(path),
>                  path,
>                  ["core", "kernel", "pin_init"],
>                  cfg=cfg,
> 
> -- 
> 2.53.0.473.g4a7958ca14-goog
> 

