Return-Path: <linux-kbuild+bounces-4140-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4B199FC57
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 01:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC202287F7A
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 23:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F152B1FDF93;
	Tue, 15 Oct 2024 23:19:58 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FC61F81B7;
	Tue, 15 Oct 2024 23:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729034398; cv=none; b=mVybWAvK1YqOP5iWoJ03E3FouD+RXxH0DWSEYEms1nXVEflhNIxdghLkP45nqwhlt3VOFyYZtXwY9tZ1YstrqQUtFrbiZQ+Mo/3zjEn+GUe8TEOrYk8LJ/1E49iU4GOtPsPHNuUGiwm0jpaBBuBDCVmWD2oxz71enDLpcFN5Tmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729034398; c=relaxed/simple;
	bh=iTwuUkf7APiW5yFPUkq/Cuo9QkvbM0O8tE08zTPSqu8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MB2jmTjUlL1SPkyodwU3NWhktWOzIUXMIr5d8qk57zmcuY4ZonmYPP58KLmxhE+HpQJA07r49h596B0fMCGeisimP3jPt1lGUELe8km2rBTp9uGJXK9NE5+QAD1MADLRkAsI9xp05ui2KStX4YuzrcJ+Zq/sPY++lBMpZ6yRBVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE5BC4CECF;
	Tue, 15 Oct 2024 23:19:57 +0000 (UTC)
Date: Tue, 15 Oct 2024 19:20:17 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: David Hunter <david.hunter.linux@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 javier.carrasco.cruz@gmail.com
Subject: Re: [PATCH v2 6/7] streamline_config.pl: process config options set
 to "y"
Message-ID: <20241015192017.173d316e@gandalf.local.home>
In-Reply-To: <20241014141345.5680-7-david.hunter.linux@gmail.com>
References: <20241014141345.5680-1-david.hunter.linux@gmail.com>
	<20241014141345.5680-7-david.hunter.linux@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Oct 2024 10:13:36 -0400
David Hunter <david.hunter.linux@gmail.com> wrote:

> An assumption made in this script is that the config options do not need
> to be processed because they will simply be in the new config file. This
> assumption is incorrect.
> 
> Process the config entries set to "y" because those config entries might
> have dependencies set to "m". If a config entry is set to "m" and is not
> loaded directly into the machine, the script will currently turn off
> that config entry; however, if that turned off config entry is a
> dependency for a "y" option. that means the config entry set to "y"
> will also be turned off later when the conf executive file is called.
> 
> Here is a model of the problem (arrows show dependency):
> 
> Original config file
> Config_1 (m) <-- Config_2 (y)
> 
> Config_1 is not loaded in this example, so it is turned off.
> After scripts/kconfig/streamline_config.pl, but before scripts/kconfig/conf
> Config_1 (n) <-- Config_2 (y)
> 
> After  scripts/kconfig/conf
> Config_1 (n) <-- Config_2 (n)

Hmm, can you show the example of this. My worry here is that there are a
lot of cases that have:

 Config_1 (m) <-- Config_2 (y)

Where Config_2 is just some binary option to modify the module set by
Config_1. If we keep Config_1 because there's some 'y' that selects it, we
are going to keep a lot of unused modules around.

> 
> It should also be noted that any module in the dependency chain will
> also be turned off, even if that module is loaded directly onto the
> computer. Here is an example:
> 
> Original config file
> Config_1 (m) <-- Config_2 (y) <-- Config_3 (m)

If Config_3 is used, then it should add Config_2 as a dependency. I guess
that's what this patch does.

> 
> Config_3 will be loaded in this example.
> After scripts/kconfig/streamline_config.pl, but before scripts/kconfig/conf
> Config_1 (n) <-- Config_2 (y) <-- Config_3 (m)
> 
> After scripts/kconfig/conf
> Config_1 (n) <-- Config_2 (n) <-- Config_3 (n)
> 
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---
> V1 https://lore.kernel.org/all/20240913171205.22126-8-david.hunter.linux@gmail.com/
> 
> V2
>         - change subject
>         - changed part of the code that only processed config options 
>           set to "m" so that config options set to "y" are processed. I
>           forgot to put this in v1 when making the series patch.
>         - removed an unneccessary condition that would have skipped a
>           dependency loop.
> ---
>  scripts/kconfig/streamline_config.pl | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index 4149c4b344db..c3b434220c9f 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -473,6 +473,11 @@ foreach my $line (@config_file) {
>  
>      if (/(CONFIG_[$valid]*)=(m|y)/) {
>  	$orig_configs{$1} = $2;
> +	# all configs options set to 'y' need to be processed
> +	if ($2 eq "y") {
> +            $configs{$1}= $2;
> +        }
> +
>      }
>  }
>  
> @@ -499,8 +504,8 @@ sub parse_config_depends
>  
>  	    $p =~ s/^[^$valid]*[$valid]+//;
>  
> -	    # We only need to process if the depend config is a module
> -	    if (!defined($orig_configs{$conf}) || $orig_configs{$conf} eq "y") {
> +	    # Make sure that this config exists in the current .config file
> +	    if (!defined($orig_configs{$conf})) {
>  		next;
>  	    }
>  
> @@ -600,12 +605,6 @@ sub loop_depend {
>  
>        forloop:
>  	foreach my $config (keys %configs) {
> -
> -	    # If this config is not a module, we do not need to process it
> -	    if (defined($orig_configs{$config}) && $orig_configs{$config} ne "m") {
> -		next forloop;
> -	    }
> -

OK, and I guess you tests show this doesn't have any other issues. I'll check it out.

Thanks,

-- Steve


>  	    $config =~ s/^CONFIG_//;
>  	    $depconfig = $config;
>  


