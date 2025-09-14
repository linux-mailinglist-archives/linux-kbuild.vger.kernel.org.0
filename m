Return-Path: <linux-kbuild+bounces-8825-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E969DB583A4
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Sep 2025 19:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DFDD3BD1EC
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Sep 2025 17:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C479B285C91;
	Mon, 15 Sep 2025 17:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pndTdo9O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913191F1306;
	Mon, 15 Sep 2025 17:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757957451; cv=none; b=OdnQV5MVpdjKjbBKHoYTkvWfSKHML8PJ/1d6x87wOmKD9TS6tRbfHK5V2xiAa0PX6v2UKZuw1CCisW653pEynNIsrfzTHkJI7cCoqJdTDo8XYmbWFLFX9pl2eE0hvvD68d69P+xyv1E2pRQupXjCmISqaXAhzsYbWQ4YpeFmPjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757957451; c=relaxed/simple;
	bh=WfBD2ku5zItvIWseXBlu1LC2F12se3T+r5FFS4mI+Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S15aAwI511FGfHkmb2+kp60Z3ETQXDXqzJmmzVVWEx5Vj0k8PDXO/rlN7NF6Qa7Njt2gQNXrnuZXVvu6urrejU7pkOEqCg/42tK84NfkGOY6SXveWCE4hdg52DEWLl3Pb0h9glJzmgnL/KoWkFC3LofLjCzfXbQR4nG8xUuOFRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pndTdo9O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC445C4CEF1;
	Mon, 15 Sep 2025 17:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757957451;
	bh=WfBD2ku5zItvIWseXBlu1LC2F12se3T+r5FFS4mI+Dc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pndTdo9OdnC/0rKy3hIqm8KghFCTkttD7gPB2RGecfzXSY9vmZWhN/wExJZk7uA3p
	 JUK1kNYL/1I7DEDUmGe6NUt10tQB69lu8+ykZ7C8BC0N67V2/f8hFa5CP6TIQnu3/B
	 WM9QDeHsH6dEm+4flkUrnPRybLup840KzCXbrtQLW/kERQdDn5Eux6kBI/Wqt9NZMc
	 kBFWIOj0wK4COqh7b9XPQkCiZtSH8iH/2q6X3QpaVgFHIZp1BtDe80rJJydqbdiWs7
	 bx/IXKEDpd3KWD56EofrJZp8a7RBwDM9UE2+3bbx3oPtKHTeCnwn0ozENpSpX5eFH/
	 nuhkGMtxblReg==
Date: Sun, 14 Sep 2025 22:07:09 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Alexey Gladkov <legion@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 6/8] modpost: Add modname to mod_device_table alias
Message-ID: <aMcgbY6b5y1K4JFM@levanger>
References: <cover.1755535876.git.legion@kernel.org>
 <66785b63b47878446a15bcb14a9ef42dc3bda092.1755535876.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66785b63b47878446a15bcb14a9ef42dc3bda092.1755535876.git.legion@kernel.org>

On Mon, Aug 18, 2025 at 06:55:00PM +0200, Alexey Gladkov wrote:
> At this point, if a symbol is compiled as part of the kernel,
> information about which module the symbol belongs to is lost.
> 
> To save this it is possible to add the module name to the alias name.
> It's not very pretty, but it's possible for now.
> 
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Andreas Hindborg <a.hindborg@kernel.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Alex Gaynor <alex.gaynor@gmail.com>
> Cc: rust-for-linux@vger.kernel.org
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  include/linux/module.h   | 14 +++++++++++++-
>  rust/kernel/device_id.rs |  8 ++++----
>  scripts/mod/file2alias.c | 18 ++++++++++++++----
>  3 files changed, 31 insertions(+), 9 deletions(-)
> 
...
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 00586119a25b7..13021266a18f8 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -1476,8 +1476,8 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
>  {
>  	void *symval;
>  	char *zeros = NULL;
> -	const char *type, *name;
> -	size_t typelen;
> +	const char *type, *name, *modname;
> +	size_t typelen, modnamelen;

when applying the patch-set onto kbuild-next, gcc refuses to build this patch
(this possibly killing future bisecting):

../scripts/mod/file2alias.c: In function ‘handle_moddevtable’:
../scripts/mod/file2alias.c:1480:25: error: variable ‘modnamelen’ set but not used [-Werror=unused-but-set-variable]
 1480 |         size_t typelen, modnamelen;
      |                         ^~~~~~~~~~
cc1: all warnings being treated as errors
make[2]: *** [../scripts/Makefile.host:131: scripts/mod/file2alias.o] Error 

(-Werror is on for userprogs, since commit
27758d8c2583d10472b745a43ff86fef96c11ef7)

Introduction of modnamelen has to be moved to the next patch.

Kind regards
Nicolas


