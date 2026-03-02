Return-Path: <linux-kbuild+bounces-11523-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKpUNZADpmmzIwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11523-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 22:39:28 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8F51E3960
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 22:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3088335F2D6
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2026 21:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976CD384CD1;
	Mon,  2 Mar 2026 20:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tIhx94tz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7288A384CBF;
	Mon,  2 Mar 2026 20:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772484549; cv=none; b=CFVmA3LfQqg/nemYSpKOmN5gI4dNJ48m2Gr5nkBNO24O6dMxhmSoKW37tnpb74SWiFqYQnFKEgUYMGOL95jP94ZEjsJ+MnU0UlVwi+xh1qZFW7J3UBhrHPiDsdscbfLomwrolcP+pIi6BcYXCl1CXKIJhVUdlX8Ao3szifvZ81c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772484549; c=relaxed/simple;
	bh=B3ZA9o5zRO2yOzXEjcCbY3SyEa0cr+byBzCZz1FWVSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGUNckHEj2cxPI2ckdtoQ94zonWgNJcurmA/Mj9DOytDPLwiHfjDZpoghEG4CgGmdScr2J5oKBN9K4W4ekc5n8t2SLtU1/GXbpU4+HCcP12Cfsra5KLRE8jOM2EY4uqJgKpqpnLuQSlNHVl8CupSXDCtnXWXT27RQTw1KRFe4ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tIhx94tz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FFEC19423;
	Mon,  2 Mar 2026 20:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772484549;
	bh=B3ZA9o5zRO2yOzXEjcCbY3SyEa0cr+byBzCZz1FWVSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tIhx94tz3/cMKL2ABo3XqtxfzJfDq3/32HQ2MaLoxvOIYAA2u/7pDHO7p4lxEbCu4
	 6Psq/0w8VEjYZ1GnLCsqJd2ayH9WAki0rJenNYpPYFJwnSVj52gONlhtHuepsCg/RR
	 YejxX2Mbx2Yd4/wKMlhEB75ipQNJJTt8DhXGf9OkjnVdBgUqzQbmzN+0qxsY1BJxso
	 5/pPqb7B8xiGO/xk1ijNvrbXdmsTAZ4oet005wtapib7nEETgGTYOL1CXL1KNZtlGg
	 EgwW98wLV2AoBvAyr7X4KucIKrtxUPLU1a26fu1tKi8yGBwZKbISx1PLSbZBYUCZKk
	 DM2d/xDtQF5bA==
Date: Mon, 2 Mar 2026 13:49:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
	Thorsten Leemhuis <linux@leemhuis.info>
Cc: Nicolas Schier <nsc@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Rainer Fiebig <jrf@mailbox.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: -next build error due to "kbuild: Leave objtool binary around
 with 'make clean'"
Message-ID: <20260302204903.GA2007498@ax162>
References: <20260227-avoid-objtool-binary-removal-clean-v1-1-122f3e55eae9@kernel.org>
 <03045f41-fe4c-44ff-b01c-6e325d82255a@leemhuis.info>
 <aaXofbe_5QGYYuMB@kitsune.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaXofbe_5QGYYuMB@kitsune.suse.cz>
X-Rspamd-Queue-Id: 3F8F51E3960
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11523-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,copr.fedorainfracloud.org:url]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 08:43:57PM +0100, Michal Suchánek wrote:
> On Mon, Mar 02, 2026 at 08:18:17PM +0100, Thorsten Leemhuis wrote:
> > On 2/28/26 06:40, Nathan Chancellor wrote:
> > > The difference between 'make clean' and 'make mrproper' is documented in
> > > 'make help' as:
> > > 
> > >   clean     - Remove most generated files but keep the config and
> > >               enough build support to build external modules
> > >   mrproper  - Remove all generated files + config + various backup files
> > > 
> > > After commit 68b4fe32d737 ("kbuild: Add objtool to top-level clean
> > > target"), running 'make clean' then attempting to build an external
> > > module with the resulting build directory fails with
> > > 
> > >   $ make ARCH=x86_64 O=build clean
> > > 
> > >   $ make -C build M=... MO=...
> > >   ...
> > >   /bin/sh: line 1: .../build/tools/objtool/objtool: No such file or directory
> > > 
> > > as 'make clean' removes the objtool binary.
> > > 
> > > Split the objtool clean target into mrproper and clean like Kbuild does
> > > and remove all generated artifacts with 'make clean' except for the
> > > objtool binary, which is removed with 'make mrproper'.
> > 
> > Thx for fixing this regression, sadly this caused my daily -next rpm
> > builds for Fedora to fail on x86_64 during a "make mrproper":
> > 
> > ""
> > kernel.spec:2485: InitBuildVars: Copy files
> > + /usr/bin/make -s 'HOSTCFLAGS=-O2  -fexceptions -g -grecord-gcc-switches -pipe -Wall -Werror=format-security -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3 -Wp,-D_GLIBCXX_ASSERTIONS -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -fstack-protector-strong -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -m64 -march=x86-64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -mtls-dialect=gnu2   ' 'HOSTLDFLAGS=-Wl,-z,relro -Wl,--as-needed  -Wl,-z,pack-relative-relocs -Wl,-z,now -specs=/usr/lib/rpm/redhat/redhat-hardened-ld -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -Wl,--build-id=sha1 -specs=/usr/lib/rpm/redhat/redhat-package-notes ' -j32 mrproper
> > find: cannot delete ‘/builddir/build/BUILD/kernel-7.0.0-build/kernel-next-20260302/linux-7.0.0-0.0.next.20260302.121.vanilla.fc42.x86_64/tools/objtool/.check.o.cmd’: No such file or directory
> > find: cannot delete ‘/builddir/build/BUILD/kernel-7.0.0-build/kernel-next-20260302/linux-7.0.0-0.0.next.20260302.121.vanilla.fc42.x86_64/tools/objtool/.elf.o.cmd’: No such file or directory
> > [and many more like these]
> > ""
> > For the full build log, see:
> > https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/fedora-42-x86_64/10183736-next-next-all/builder-live.log.gz
> > 
> > This is almost exactly the rpm spec file that is used in Fedora rawhide.
> > The sections that causes this looks like this:
> > 
> > """
> >     %{log_msg "InitBuildVars: Copy files"}
> >     %{make} %{?_smp_mflags} mrproper
...
> Or does the objtool_clean run multiple times in parallel, once through
> the clean target, and once as dependency of the mrproper target?

More than likely this based on my reading of the submake processes from
the build log. For what it's worth, I cannot reproduce this error on
either a really fast or really slow build machine but it should not be
hard to avoid by using 'xargs rm -f' like the rest of Kbuild does for
removing things, which should suppress the error if the file does not
exist. Thorsten, could you see if this diff makes a difference for you?
If so, I'll squash it in with a note.

diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 50d3e38e6137..76bcd4e85de3 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -142,7 +142,7 @@ $(LIBSUBCMD)-clean:
 	$(Q)$(RM) -r -- $(LIBSUBCMD_OUTPUT)
 
 clean: $(LIBSUBCMD)-clean
-	$(Q)find $(OUTPUT) -name '*.o' -delete -o -name '\.*.cmd' -delete -o -name '\.*.d' -delete
+	$(Q)find $(OUTPUT) \( -name '*.o' -o -name '\.*.cmd' -o -name '\.*.d' \) -type f -print | xargs $(RM)
 	$(Q)$(RM) $(OUTPUT)arch/x86/lib/cpu-feature-names.c $(OUTPUT)fixdep
 	$(Q)$(RM) $(OUTPUT)arch/x86/lib/inat-tables.c $(OUTPUT)fixdep
 	$(Q)$(RM) -- $(OUTPUT)FEATURE-DUMP.objtool

