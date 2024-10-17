Return-Path: <linux-kbuild+bounces-4175-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9081F9A30C1
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Oct 2024 00:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15A6EB227A4
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 22:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9E11D7E4A;
	Thu, 17 Oct 2024 22:32:13 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D411D79A4;
	Thu, 17 Oct 2024 22:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729204333; cv=none; b=DOguORw0Tj7mnysYV0XbS66CZCIPbZYn3bz9J79XImqFOpEZpw38+ND8vH01wQ3c/wEdoZwqhCaVg6JVTB/qopXduOctH968dZj46EHLEHLpg9xNK0Qg1bxcNhbwp91mnRLzy/IZPdAGwoZSmyeKZs2Xu9J2V7kc92S0AMNa+cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729204333; c=relaxed/simple;
	bh=0V9XjGqGrActrQeGh4qLOjUJHPwX1XSu/VYcTb4uuu8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AsrQyXYtHAuLYyPe4pHR7vVMEyk9UhkRUybyc/YeG/1bNzPvTgKaiMdwkjorS5zkJvqLaEYloeoTtZqCOcc9jnqLUwsyBSMhZPQrsOWgC3nuJ2BwhtyVluMW61yQEdY5ph4PeJxKk3DDxsOiAydz8TMe/lC6NYHyviWYQ24UJjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB663C4CED0;
	Thu, 17 Oct 2024 22:32:11 +0000 (UTC)
Date: Thu, 17 Oct 2024 18:32:35 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: David Hunter <david.hunter.linux@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 javier.carrasco.cruz@gmail.com
Subject: Re: [PATCH v2 5/7] streamline_config.pl: fix: implement choice for
 kconfigs
Message-ID: <20241017183235.2d8930a2@gandalf.local.home>
In-Reply-To: <20241014141345.5680-6-david.hunter.linux@gmail.com>
References: <20241014141345.5680-1-david.hunter.linux@gmail.com>
	<20241014141345.5680-6-david.hunter.linux@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Oct 2024 10:13:35 -0400
David Hunter <david.hunter.linux@gmail.com> wrote:

> Properly implement the config entries that are within the choice keyword
> for kconfig. Currently, the script only stops the previous config entry
> when a choice keyword is encountered.
> 
> When the keyword "choice" is encountered, do the following:
>         - distribute the lines immediately following the "choice"
>           keyword to each config entry inside the "choice" section.
>         - process the config entries with the distributed lines.
> 
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---
> V1 https://lore.kernel.org/all/20240913171205.22126-6-david.hunter.linux@gmail.com/
> 
> V2 
> 	- changed the subject prefix
> 	- changed the method for storing and distributing the choice
> 	  block. No longer using temp file. 
> ---
>  scripts/kconfig/streamline_config.pl | 47 ++++++++++++++++++++++++++--
>  1 file changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index b7ed79c5e070..4149c4b344db 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -149,6 +149,34 @@ my $var;
>  my $iflevel = 0;
>  my @ifdeps;
>  
> +# distributes choice entries to different config options
> +sub set_hash_value {
> +    my %htable = %{$_[0]};
> +    my $tmp_config = $_[1];
> +    my $current_config = $_[2];

The other functions usually make this a single line. Also, we should give
names for all parameters.

  sub set_hash_value {
      my ($phtable, $tmp_config, $current_config) = @_;
      my %htable = %{$phtable};
      if (defined($htable{$tmp_config})) {
          ${$phtable}{$current_config} = $htable{$tmp_config};
      }
  }

Names make it a bit easier to read. Perl is already know as being very
cryptic, we don't need to make it worse.

> +    if (defined($htable{$tmp_config})) {
> +	${$_[0]}{$current_config} = $htable{$tmp_config};
> +    }
> +}
> +
> +# distribute choice config entries
> +sub copy_configs {
> +    my $tmp_config = "TMP_CONFIG";
> +    my $choice_config = $_[0];

And this as:

  sub copy_configs {
     my ($choice_config) = $@;
     my $tmp_config = "TMP_CONFIG"

As parameters should always be first, which is how the rest of the file
does it. Consistency would be good.

-- Steve

> +    set_hash_value (\%depends, $tmp_config, $choice_config);
> +    set_hash_value (\%selects, $tmp_config, $choice_config);
> +    set_hash_value (\%prompts, $tmp_config, $choice_config);
> +    set_hash_value (\%defaults, $tmp_config, $choice_config);
> +}
> +
> +sub delete_temp_config {
> +    my $tmp_config = "TMP_CONFIG";
> +    $depends{$tmp_config} = undef;
> +    $selects{$tmp_config} = undef;
> +    $prompts{$tmp_config} = undef;
> +    $defaults{$tmp_config} = undef;
> +}
> +
>  # prevent recursion
>  my %read_kconfigs;
>  
> @@ -163,6 +191,7 @@ sub read_kconfig {
>  
>      my $source = "$ksource/$kconfig";
>      my $last_source = "";
> +    my $choice_activated = 0;
>  
>      # Check for any environment variables used
>      while ($source =~ /\$\((\w+)\)/ && $last_source ne $source) {
> @@ -205,9 +234,13 @@ sub read_kconfig {
>  	    $config = $2;
>  	    $config2kfile{"CONFIG_$config"} = $kconfig;
>  
> +	    if ($choice_activated) {
> +		copy_configs $config;
> +	    }
> +
>  	    # Add depends for 'if' nesting
>  	    for (my $i = 0; $i < $iflevel; $i++) {
> -		if ($i) {
> +		if (defined($depends{$config})) {
>  		    $depends{$config} .= " " . $ifdeps[$i];
>  		} else {
>  		    $depends{$config} = $ifdeps[$i];
> @@ -260,8 +293,18 @@ sub read_kconfig {
>  	    $iflevel-- if ($iflevel);
>  
>  	# stop on "help" and keywords that end a menu entry
> -	} elsif (/^\s*(---)?help(---)?\s*$/ ||
> /^(comment|choice|menu)\b/) {
> +	} elsif (/^\s*(---)?help(---)?\s*$/ || /^(comment|menu)\b/) {
>  	    $state = "NONE";
> +
> +	# for choice, distribute the lines before each config entry to
> +	# each config entry
> +	} elsif (/^\s*choice\b/) {
> +	    $choice_activated = 1;
> +	    $config = "TMP_CONFIG";
> +	    $state = "NEW";
> +	} elsif (/^\s*endchoice/) {
> +	    delete_temp_config;
> +	    $choice_activated = 0;
>  	}
>      }
>      close($kinfile);


