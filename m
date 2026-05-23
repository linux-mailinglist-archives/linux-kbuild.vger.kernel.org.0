Return-Path: <linux-kbuild+bounces-13317-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLvpLy4AEWprgQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13317-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 May 2026 03:17:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6E75BC47C
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 May 2026 03:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37BA23019FCC
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 May 2026 01:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617EB15FA81;
	Sat, 23 May 2026 01:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nk0nNDLK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2056B145355;
	Sat, 23 May 2026 01:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779499050; cv=none; b=H++31g+fQFXVp54Xuprpzi/349xWXVihimob+5ZmV9opy5l9b066HFA2zzus1NrZbBKREy/XV1imVhKPSebl2ScdibE8BZlYLjjHOkc80+PaVbV4WqtY8AeDBrrp6YuYL4yzhrMXa4ZUSghYLqVrBgLrf80137+D/LEctReAiAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779499050; c=relaxed/simple;
	bh=i/3lZb8lZXlY0K/M/zqOdtxGHQVNEkC5Acp162PQKhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbtyWDeWCFQ1lW3HLMmDNfCucxrxX6ZvNZRg8SiV4n6ltlKbObPQOpTP8miFf4oW9TzXQOJd33TvtXNKbFLboNbUC9SEMXVNQhDlkOEeiGmOPVaNlQmnco6ipWbkcf3HkFsijeQrhyD8Hw7ldBkWWtHVSJ2sIUq3CtrnVLrqzTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nk0nNDLK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2141F000E9;
	Sat, 23 May 2026 01:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779499048;
	bh=JJk/5P73IG0Jf6gdZ+X/6wOiaPgi2bb7vgUfpVrZAm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nk0nNDLK64aOetewdYpyH1zDQ38YIHaooaai12+JjzbjSIW93bAxot1n8QFYBBo0k
	 io6P7TUS0b8otOG860DuIpiUaa/6CeOa1tJqIZBFPZAb0qi1cxH9N80EtC+AsS5r4S
	 DoYmP3U3Uk+zKWlLtq+yDS1md60RSCmRtx5RlZ1EtYyI4A1O9VYdyDXZpG0m/tPOX/
	 EVrb5a0xpji//quHcsaIvWEbGjpQ0gzFZ5stC6JX+KdbGH9JFlAAO0AlZ+m9MXPZuT
	 sG/A5uAoA3jJk0Zn86/g8tdbcySuNiTCzYqkjR+2WcZcwWH4htSzRKLzvJ/XDOOaWp
	 v/AEtaIzl7gHg==
Date: Fri, 22 May 2026 18:17:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rong Xu <xur@google.com>
Cc: Yonghong Song <yonghong.song@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rafael Aquini <aquini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stafford Horne <shorne@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Piotr Gorski <piotrgorski@cachyos.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v9 3/3] kbuild: distributed build support for Clang
 ThinLTO
Message-ID: <20260523011721.GB520407@ax162>
References: <20260331154827.2793269-4-xur@google.com>
 <20260331162729.GA2006419@ax162>
 <2672f790-f57b-4739-b78f-906c0a5d202e@linux.dev>
 <CAF1bQ=R6=0G9O-eNFsHiCLMpkph7=hSu4Rn_HjFD4PvTFnAnDQ@mail.gmail.com>
 <69e60bc9-cfe6-4b8d-b61b-5840f7d2518a@linux.dev>
 <CAF1bQ=TFMSkLE6bqPEOqGxcLbC7tYfPqEmg7xrjbc2m_B=72GA@mail.gmail.com>
 <4914f246-611c-4f8a-94d5-b1d868266fd0@linux.dev>
 <CAF1bQ=Ta0LJVSiEWnhyq=mXA81m3=-gW1H+iyQyQwZ+w02g1VA@mail.gmail.com>
 <21591f06-fedd-4a51-b06c-947c72b1457f@linux.dev>
 <CAF1bQ=Q3szLgxREV2R=v9eEqDrme8r+Ky2ZtQiuXZ2A1ZrHPYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF1bQ=Q3szLgxREV2R=v9eEqDrme8r+Ky2ZtQiuXZ2A1ZrHPYw@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13317-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3C6E75BC47C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 11:58:35AM -0700, Rong Xu wrote:
> On Fri, May 22, 2026 at 11:44 AM Yonghong Song <yonghong.song@linux.dev> wrote:
> > On 5/22/26 11:14 AM, Rong Xu wrote:
> > > On Fri, May 22, 2026 at 10:52 AM Yonghong Song <yonghong.song@linux.dev> wrote:
> > >> On 5/22/26 8:32 AM, Rong Xu wrote:
> > >>> On Thu, May 21, 2026 at 2:57 PM Yonghong Song <yonghong.song@linux.dev> wrote:
> > >>>>
> > >>>> On 5/21/26 11:31 AM, Rong Xu wrote:
> > >>>>> Yonghong, thanks for the update.
> > >>>>>
> > >>>>> Regarding this guard: ther is a period of Clang (before this patch and
> > >>>>> after your first patch), even though ld.lld having these options
> > >>>>> (specifically --lto-whole-program-visibility -mllvm
> > >>>>> -always-rename-promoted-locals=false), distributed ThinLTO mode
> > >>>>> remains unsupported, correct? What the behvior of using this options
> > >>>>> in distributed mode with these compilers? nop or it will lead to
> > >>>>> error?
> > >>>> The in-process thin-lto support is landed on Feb 27.
> > >>>> The distributed thin-lto support is landed on Apr 24.
> > >>>>
> > >>>> If people are using distributed thin-lto in kernel between Feb 27 and
> > >>>> Apr 24, there will be some issues. But people typically use released
> > >>>> compiler, so we should be fine.
> > >>> This is not the case for us (google). We do use compiler b/w releases,
> > >>> and we build our own.
> > >>>
> > >>> What is the issue if we use the compiler in b/w Feb27 and Apr24?
> > >> If you use the custom compiler between Feb27 and Apr24 and your kernel
> > >> will do distributed thin-lto, you can remove
> > >>      $(call ld-option,--lto-whole-program-visibility -mllvm -always-rename-promoted-locals=false)
> > >> from your kernel. Since you have custom compiler, you can
> > >> do some customization for your kernel as well.
> > > I am referring to this specific patch -- there are cases that use
> > > custom compilers built between the February 27 and April 24 LLVM
> > > releases.
> > > I don't want to see any breakage for distributed ThinLTO in these cases.
> > >
> > > I would prefer to keep this guard for distributed ThinLTO for the time
> > > being and remove it later. What do you think?
> >
> > For 'remove it later', when this will happen? When llvm23 cuts the rc
> > in July or cut the release in September or the end of bug fix say in December?
> 
> I can remove the guard when the minimal clang containis the 4/24 patch.

I think we could just change

  ifdef CONFIG_LTO_CLANG_THIN
  KBUILD_LDFLAGS += $(call ld-option,--lto-whole-program-visibility -mllvm -always-rename-promoted-locals=false)
  endif

to

  ifneq ($(CONFIG_LTO_CLANG_THIN)$(CONFIG_LTO_CLANG_THIN_DIST),)
  KBUILD_LDFLAGS += $(if $(call clang-min-version,230100),--lto-whole-program-visibility -mllvm -always-rename-promoted-locals=false)
  endif

when LLVM 23.1.0-rc1 is out to avoid that Feb 27 to Apr 24 breakage?

> > If we carry the guard (for distributed thinlto) in this kernel release,
> > that means at some point, we will need to do kernel backport, extra work.
> 
> I don't understand here: this is part of the distributed thinlto patch
> that you would need merge anyay.
> where is the extra work for backporting?
> 
> > Also, since you are building custom in-development compiler, you can
> > disable this flag -always-rename-promoted-locals, problem solved, right?
> 
> I'm not only talking about me. There are other users also use this way.
> BTW, even in google, I don't control the compiler that being used.

So in general, we assume that folks who are using prerelease compilers
(i.e., 23.0.0 in this case) are upgrading them regularly, as we may need
to workaround or fix issues that happen in main that cannot be
dynamically detected (at least not easily or conveniently). For example,
recent main versions of clang have support for -Wattribute-alias, so we
need to turn it off via #pragmas like done for GCC, which will break
things for clang-23 versions that do not have -Wattribute-alias:

  https://git.kernel.org/nathan/c/bc5ffe737f56ee2734597069ed71f48830549483

So the argument about breaking compilers in between Feb 27 and Apr 24 is
not really relevant in my opinion since they should be short lived in
terms of deployment. However, given that things work the way the check
is currently written and the LLVM 23 branch is only a couple of months
away, I am fine with just sticking with how it is currently written and
updating it when things are more guaranteed to work.

-- 
Cheers,
Nathan

