Return-Path: <linux-kbuild+bounces-4136-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D924D99FC17
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 01:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F2171F27208
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 23:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0241B0F3C;
	Tue, 15 Oct 2024 23:09:11 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EFD173357;
	Tue, 15 Oct 2024 23:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729033751; cv=none; b=G/ka2eQaS+tI3lY9WxPQo8YQSRpdD3c3/OMBu/shjIUQBf/QoO64sITlz+cTVD+P6HwWhZekm7mrbhAoqTyZCqNPqcnreJ94qh3Ga7CR2/nu8f91K0QgZucPMHMxRq3E7MhqwIrVQx6CQi63Oz/7H5lLlUv0nj8S1lLTh5asuks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729033751; c=relaxed/simple;
	bh=I44IObKDf7VsMmUgcpGI5zcawuH+DoXy8wNWHjUm0f4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nnsn5+MYwkoouQ7yQxsi55yisEyDybf8wbQ8IQokRe4zn9eY+JHcP3IHWr74FRQWib6DEhG/57ZXqLkMhuKMPMMOXmh37q4otgqCeEbNa0ww9WSKarKMYlnZPVMHzfDeBnWLrBNZk5mEdkaBMiS4JKmU/GGM7kyPAXYDw4HXm4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B73C4CEC6;
	Tue, 15 Oct 2024 23:09:10 +0000 (UTC)
Date: Tue, 15 Oct 2024 19:09:29 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: David Hunter <david.hunter.linux@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 javier.carrasco.cruz@gmail.com
Subject: Re: [PATCH v2 2/7] streamline_config.pl: ensure all defaults are
 tracked
Message-ID: <20241015190929.077535b4@gandalf.local.home>
In-Reply-To: <20241014141345.5680-3-david.hunter.linux@gmail.com>
References: <20241014141345.5680-1-david.hunter.linux@gmail.com>
	<20241014141345.5680-3-david.hunter.linux@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Oct 2024 10:13:32 -0400
David Hunter <david.hunter.linux@gmail.com> wrote:

Hi David,

Thanks for sending these.

> Track default options on the second line. On the second line of some
> config entries, default and depndency options sometimes appear. In those
			      "dependency"

> instances, the state will be "NEW" and not "DEP".

Can you list some examples of where this happens?

Thanks,

-- Steve

> 
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---
> V1 https://lore.kernel.org/all/20240913171205.22126-4-david.hunter.linux@gmail.com/
> 
> V2
> 	- changed the subject
> 	- changed the condition to be more in line with the script style 
> ---
>  scripts/kconfig/streamline_config.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index a85d6a3108a1..85f4712e2bf3 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -220,7 +220,7 @@ sub read_kconfig {
>  	    $depends{$config} = $1;
>  	} elsif ($state eq "DEP" && /^\s*depends\s+on\s+(.*)$/) {
>  	    $depends{$config} .= " " . $1;
> -	} elsif ($state eq "DEP" && /^\s*def(_(bool|tristate)|ault)\s+(\S.*)$/) {
> +	} elsif ($state ne "NONE" && /^\s*def(_(bool|tristate)|ault)\s+(\S.*)$/) {
>  	    my $dep = $3;
>  	    if ($dep !~ /^\s*(y|m|n)\s*$/) {
>  		$dep =~ s/.*\sif\s+//;


