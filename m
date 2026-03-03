Return-Path: <linux-kbuild+bounces-11534-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD0LOWUMp2kDcgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11534-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 17:29:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D4E1F3C98
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 17:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D39E630341AE
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Mar 2026 16:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D583B8BBB;
	Tue,  3 Mar 2026 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tBqe3GLm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oJw0uUK3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tBqe3GLm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oJw0uUK3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE9B4DA52C
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Mar 2026 16:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772555266; cv=none; b=tMoXe8CBFQemJmcI4GXmmxsBEc90vgYFjaEGoOAT45s8MXCNxbiY1aNsM/Kxet1bJ5RRWz6FnwrztXJBf2x5fYz0+9nVTjhw4FgsT10r9RK/Ehj/o+3XaUz6iIPb45lTELGJC/iMWHJfz+wVdPGgkzJ2elW0899h/HVIrcnG5r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772555266; c=relaxed/simple;
	bh=byZAUyWz81c5DFKyBiyvfvT9A9jjabhbwyYhYIZEi5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vo52CnJcpF8D/gCitX4w8jDzh4dDIapQH3dXsn2uTkGIChetCzd4teb8FR+Wd80qTBcbPyj1kgdr2WV7Yl5TCpCoFqfVTtiOXp4WQ8ml9coP5le0wO5g0dz9Y56nMy8SU591bXG5tXBMyyAfuah9V4LrbYd1pwT4iYJsu3MK6oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tBqe3GLm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oJw0uUK3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tBqe3GLm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oJw0uUK3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B41F73F899;
	Tue,  3 Mar 2026 16:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772555263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pPbHWtJiTVhiPGl8lounEp5sudxktqt1s5J2p/vyz4Q=;
	b=tBqe3GLm5jhYnBeaRa1kCaj9zQqwPEoicq3KivhtEKju16/NN+hHWl0At9AVfdPS/ZsccF
	Ke3Cek+JIdn/1p+J+xeM0fQB3aChQKaaUMAM5PbkIXA1CiZc7B+hm9czpAlj4V6XceGuIi
	yit64ODXlKRNc60+oT4suquNoVhTq+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772555263;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pPbHWtJiTVhiPGl8lounEp5sudxktqt1s5J2p/vyz4Q=;
	b=oJw0uUK3JIa6gDxR38+ROzDxDucJI+xs/RzzWGmYI9CxGSC3HM93kuzQnSCuiRBndaevFb
	Q/Xr2ZL5dlVXIQAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772555263; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pPbHWtJiTVhiPGl8lounEp5sudxktqt1s5J2p/vyz4Q=;
	b=tBqe3GLm5jhYnBeaRa1kCaj9zQqwPEoicq3KivhtEKju16/NN+hHWl0At9AVfdPS/ZsccF
	Ke3Cek+JIdn/1p+J+xeM0fQB3aChQKaaUMAM5PbkIXA1CiZc7B+hm9czpAlj4V6XceGuIi
	yit64ODXlKRNc60+oT4suquNoVhTq+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772555263;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pPbHWtJiTVhiPGl8lounEp5sudxktqt1s5J2p/vyz4Q=;
	b=oJw0uUK3JIa6gDxR38+ROzDxDucJI+xs/RzzWGmYI9CxGSC3HM93kuzQnSCuiRBndaevFb
	Q/Xr2ZL5dlVXIQAw==
Date: Tue, 3 Mar 2026 17:27:42 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kbuild@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH] kbuild: only clean objtool on mrproper
Message-ID: <aacL_hWLqn5E6c_y@kitsune.suse.cz>
References: <20260225112633.6123-1-msuchanek@suse.de>
 <20260225200417.GE2755225@ax162>
 <aZ9aLWIAzsWfYNyf@kitsune.suse.cz>
 <20260225212105.GG2755225@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225212105.GG2755225@ax162>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Rspamd-Queue-Id: 02D4E1F3C98
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11534-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[msuchanek@suse.de,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,kitsune.suse.cz:mid]
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 02:21:05PM -0700, Nathan Chancellor wrote:
> On Wed, Feb 25, 2026 at 09:23:09PM +0100, Michal Suchánek wrote:
> > On Wed, Feb 25, 2026 at 01:04:17PM -0700, Nathan Chancellor wrote:
> > > Wouldn't resolve_btfids need the same treatment?
> > 
> > No, make clean runs the clean target for resolve_btfids but the tool
> > remains.
> 
> That does not reproduce for me personally:
> 
>   $ cat kernel/configs/btf.config
>   CONFIG_BPF_SYSCALL=y
>   # CONFIG_DEBUG_INFO_NONE is not set
>   CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>   CONFIG_DEBUG_INFO_BTF=y
> 
>   $ make -skj"$(nproc)" ARCH=x86_64 O=build mrproper defconfig btf.config prepare
> 
>   $ ls -al build/tools/{bpf/resolve_btfids/resolve_btfids,objtool/objtool}
>   -rwxr-xr-x 1 nathan nathan 2224456 Feb 25 13:33 build/tools/bpf/resolve_btfids/resolve_btfids
>   -rwxr-xr-x 1 nathan nathan 4046296 Feb 25 13:33 build/tools/objtool/objtool
> 
>   $ make -skj"$(nproc)" ARCH=x86_64 O=build clean
> 
>   $ ls -al build/tools/{bpf/resolve_btfids/resolve_btfids,objtool/objtool}
>   "build/tools/bpf/resolve_btfids/resolve_btfids": No such file or directory (os error 2)
>   "build/tools/objtool/objtool": No such file or directory (os error 2)
> 
> I guess resolve_btfids is not strictly required for external module
> builds because vmlinux may not be present and cmd_btf_ko handles that
> gracefully.

Yes, you are right. The reason why this was not a problem with
resolve_btfids is that missing resolve_btfids is not an error. Or
possibly it's not an error when vmlinux is not in a location where the
build can find it.

resolve_btfids should probably also be preserved but it was not reported
as a bug so far because the case when it would be a problem is fairly
unlikely.

Thanks

Michal

