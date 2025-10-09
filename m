Return-Path: <linux-kbuild+bounces-9062-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8174CBC83FD
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Oct 2025 11:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2E1C035339D
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Oct 2025 09:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC0728CF42;
	Thu,  9 Oct 2025 09:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vAmjNd4p"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6174527B342;
	Thu,  9 Oct 2025 09:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760001398; cv=none; b=jw1v8vsAUCr4A4qg+k3v0F1BhM6sc9T1y8gmxdp7Fv+a46WJ1pk+9xbJBYLEV1kcQrIRyhgPvbQd3Re+VsNpaWYteTnftGO2yCq5gz2LVbBQhmcoM767aCKxsthMLvOSqRlQ+vMqxdQwj2lu1ThmlQcSfPUWX5PmpgaNYat37ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760001398; c=relaxed/simple;
	bh=3bbSTaA6jx0Vh3WaS6Gw5mXl4+WFYO4/FoQ/kCiHfkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIPQwi7NOIKTFRzYt2Aq8CO05uVacB9J6yCamz3pqkxZze8m6kv2Q6VRat1zudLXMbf37zAnL7vmRGSIICHX4MFjpqe8ybyRZebipbU/P4jfTaZzgT0rEjfy7HAsizUCc1sLUT+b51sCyAbOL2JGxUZz2aRrcwnmEoUjgFPSemM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vAmjNd4p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBC6C4CEE7;
	Thu,  9 Oct 2025 09:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760001397;
	bh=3bbSTaA6jx0Vh3WaS6Gw5mXl4+WFYO4/FoQ/kCiHfkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vAmjNd4pnf+M+PxkFm/3dI0CFKy++he7RbM6M/bkI5JvZwwoEquy9sbhWEUUZ490r
	 hglyjsstvFfM7lBf+KFAZU9uwuLR4Q+5KPuEHHhtUl8cXybzmsok8CNifGMqTUhn3J
	 YlMYd9Q9+YUfXU3Hbc5kewJjY2KgKgDrDB5WlEOhVJCO1zjQVNLwA0jFzZGgBDOsIT
	 kYuIjj5J3DpKNsqPrXmNLS3OBzfYfvB3bXvQaGnQIX4VCq3i11Aqy19aRV0EUxrbDe
	 IiPphsnP36xlnmudvTL+yQGDwaImhU3zSu/kv3367B3IvJGTYA2HSvzGMlCX2QApsW
	 ZCSWN01UT9/TA==
Date: Thu, 9 Oct 2025 11:02:59 +0200
From: Nicolas Schier <nsc@kernel.org>
To: HONG Yifan <elsk@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>, kernel-team@android.com,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: use $(obj)/ instead of $(src)/ for COPY
Message-ID: <aOd6QzKQKcYoxMf0@levanger>
References: <20251006193839.1350626-1-elsk@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006193839.1350626-1-elsk@google.com>

On Mon, Oct 06, 2025 at 07:38:38PM +0000, HONG Yifan wrote:
> Similar to
> commit 9a0ebe5011f4 ("kbuild: use $(obj)/ instead of $(src)/ for common pattern rules")
> 
> This change updates the COPY rule to use $(obj) instead of $(src). This
> makes Kbuild rules like
> 
>     always-y += libfoo/.foo.o.cmd

This is a strange example.  Why should we ship any prebuilt .*.o.cmd file?

> 
> work when the user provides libfoo/.foo.o.cmd_shipped, even when obj and
> src is different and src is an absolute path. This is useful when foo.o
> and .foo.o.cmd are checked-in as prebuilts.
> 
> (Admittedly, `always-y += libfoo/.foo.o.cmd` is not recommended in
> kbuild/modules.rst, "Several Subdirectories".)
> 
> For example, if
> 
>     obj=.
>     src=/some/path
> 
> then the original rule
> 
>     $(obj)/%: $(src)/%_shipped
> 
> expands to
> 
>     ./%: /some/path/%_shipped
> 
> And when matching against the above example, the stem is just `bar.o`
> [^1] so the following is looked up:
> 
>     libfoo/.foo.o.cmd: libfoo//some/path/.foo.o.cmd_shipped
> 
> ... and it cannot be matched.
> 
> With this change, the rule expands to
> 
>     ./%: ./%_shipped
> 
> ... and it should work, at least for files that does not have a more
> specific pattern rule.
> 
> NOTE: that after this change, code like
> 
>     bar-y += libfoo/foo.o
> 
> ... with libfoo/foo.o_shipped provided still DOES NOT work, because
> the pattern rule $(obj)/%.o takes priority. For .o_shipped files,
> the user still needs an explicit `$(obj)/%.o: $(obj)/%.o_shipped` rule
> in its own Kbuild file.
> 
> [^1]: https://www.gnu.org/software/make/manual/html_node/Pattern-Match.html
> 
> Signed-off-by: HONG Yifan <elsk@google.com>
> ---
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 1d581ba5df66..e066b7b00bcc 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -272,7 +272,7 @@ endef
>  quiet_cmd_copy = COPY    $@
>        cmd_copy = cat $< > $@
>  
> -$(obj)/%: $(src)/%_shipped
> +$(obj)/%: $(obj)/%_shipped
>  	$(call cmd,copy)

No, I don't see a reason to support *_shipped files from the build tree.
The purpose of *_shipped is to deliver prebuilt files with the source
tree to allow or simplify building the corresponding output files.

Kind regards,
Nicolas

