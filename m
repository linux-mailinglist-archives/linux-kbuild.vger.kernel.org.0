Return-Path: <linux-kbuild+bounces-13747-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fv0TBHiWLWr6hgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13747-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jun 2026 19:42:16 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2EE67F325
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jun 2026 19:42:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="FkzL/nFv";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13747-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13747-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7C863007F7B
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jun 2026 17:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F2237F744;
	Sat, 13 Jun 2026 17:41:39 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C22321420;
	Sat, 13 Jun 2026 17:41:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781372499; cv=none; b=qdfElrvMZJJUq32MBZeBmoOJMo1T7e04sZf+4yMbe//38UZzDoCjcKDXZv7GHG/4eiVjX8aSIo/3rkSSoxLRit72m1IoQ3cSS64eyqaAR+tEyccg5zGeYdxCTDW/VUcFUT/kumjrh8evYl+UzqCoAKIaStmvCrTznHjrADyRf7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781372499; c=relaxed/simple;
	bh=Yu34RnKrBOohm55m9lVO18WTTRs0FIgd/HBlln191Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C1jrd4TkmHMzXyfHu2A+rtqfRrAqwMuOVkxfeT737Khi2gA/vq2De2J/j2t2Huk8rwwuyU5uBq2erzJBnPNpT05p06SmpD6jchl6kWxtD8aaj7seVp52O5hphlQlPDZMMFK7lEvq/XJnp1AL6bn3odSdKPXVCT5iOX4Ab6Hl7aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkzL/nFv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2ED241F000E9;
	Sat, 13 Jun 2026 17:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781372497;
	bh=CrVbd8XiWduTJRK7vc9W39csYSLbgHJhf+UYLd6BDuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FkzL/nFvNt1fcsrClUg1MSbg9oBfgW/svfpZ6dVZVwz1+EGeToY0wNgOdzbvlnKqB
	 7bp/HlnAPrb+zPhZRY5LKx2Kb65TnHsSF7hc11RG020tdbPmMffIVnbhkCjXib1H5h
	 zrSmKndqowCxYQyP+0rpuqakU0sOlkaqKUf7Q+uHOiE5BfXTDnqwc/sRBOtV5wVZ68
	 3VG5/njFW1mE3F1i/rhydVd0WwjU85tDFbw8N1rLKmJ7KQ1L6wlTtbzNc/bB/smo2e
	 dIEYmdbFhdUau9TGdM3zr3ig+OOYnmP7IxY0fxNtM3kidJkJZ5zRh1+31KVQQ/AFsl
	 YjZkEHzaoPvbw==
Date: Sat, 13 Jun 2026 19:39:04 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Sterba <dsterba@suse.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hariharan Basuthkar <quic_hbasuthk@quicinc.com>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Filipe Manana <fdmanana@suse.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>, Takashi Iwai <tiwai@suse.de>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Chih-Kang Chang <gary.chang@realtek.com>,
	David Lechner <dlechner@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Aleksander Jan Bajkowski <olek2@wp.pl>, Boris Burkov <boris@bur.io>,
	Blake Jones <blakejones@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v5 2/4] scripts/jobserver-exec: propagate child exit
 status
Message-ID: <ai2VuFWUxVRGjGKR@levanger>
Mail-Followup-To: Daniel Golle <daniel@makrotopia.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Sterba <dsterba@suse.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hariharan Basuthkar <quic_hbasuthk@quicinc.com>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Filipe Manana <fdmanana@suse.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>, Takashi Iwai <tiwai@suse.de>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Chih-Kang Chang <gary.chang@realtek.com>,
	David Lechner <dlechner@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Aleksander Jan Bajkowski <olek2@wp.pl>, Boris Burkov <boris@bur.io>,
	Blake Jones <blakejones@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
References: <cover.1779908995.git.daniel@makrotopia.org>
 <660368ca16e2d3845577a9fd157d2f37f0e09e85.1779908995.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <660368ca16e2d3845577a9fd157d2f37f0e09e85.1779908995.git.daniel@makrotopia.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel@makrotopia.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nathan@kernel.org,m:saravanak@kernel.org,m:pkshih@realtek.com,m:andriy.shevchenko@linux.intel.com,m:dsterba@suse.com,m:bryan.odonoghue@linaro.org,m:quic_hbasuthk@quicinc.com,m:jeff.hugo@oss.qualcomm.com,m:fdmanana@suse.com,m:rtl8821cerfe2@gmail.com,m:richard.weiyang@gmail.com,m:tiwai@suse.de,m:aurabindo.pillai@amd.com,m:gary.chang@realtek.com,m:dlechner@baylibre.com,m:ojeda@kernel.org,m:gary@garyguo.net,m:tamird@kernel.org,m:linux@weissschuh.net,m:pagadala.yesu.anjaneyulu@intel.com,m:brgl@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:masahiroy@kernel.org,m:linux@roeck-us.net,m:olek2@wp.pl,m:boris@bur.io,m:blakejones@google.com,m:corbet@lwn.net,m:mchehab+huawei@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:richardweiyang@gmail.com,m:mchehab@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13747-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,realtek.com,linux.intel.com,suse.com,linaro.org,quicinc.com,oss.qualcomm.com,gmail.com,suse.de,amd.com,baylibre.com,garyguo.net,weissschuh.net,intel.com,roeck-us.net,wp.pl,bur.io,google.com,lwn.net,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,dt,huawei];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,makrotopia.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C2EE67F325

On Wed, May 27, 2026 at 08:32:18PM +0100, Daniel Golle wrote:
> main() called JobserverExec().run() and discarded its return value,
> then the script exited with the implicit status 0. As a result, any
> Makefile that wired a build step through jobserver-exec saw the step
> silently succeed even when the wrapped command had failed.
> 
> Two in-tree callers were affected:
> 
>   Documentation/devicetree/bindings/Makefile
>     cmd_chk_style runs a python checker via jobserver-exec and uses
>     "&& touch $@ || true" so failures leave the stamp file untouched
>     and the next make rerun reports them again. The swallowed exit
>     code made the stamp file get created even on failure, caching the
>     failed run and hiding the reported issues until the inputs change.
> 
>   scripts/Makefile.vmlinux_o
>     cmd_gen_initcalls_lds runs scripts/generate_initcall_order.pl via
>     jobserver-exec; a perl failure was masked by the wrapper.
> 
> Return the subprocess exit code from main() and pass it to sys.exit()
> so the wrapped command's status reaches make.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v5: new patch; prereq for chk_style in 3/4 so style failures
>     leave the stamp file untouched instead of being cached
> 
>  scripts/jobserver-exec | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/jobserver-exec b/scripts/jobserver-exec
> index 758e947a6fb9..21b319e6c9a5 100755
> --- a/scripts/jobserver-exec
> +++ b/scripts/jobserver-exec
> @@ -28,8 +28,8 @@ def main():
>          sys.exit("usage: " + name +" command [args ...]\n" + __doc__)
>  
>      with JobserverExec() as jobserver:
> -        jobserver.run(sys.argv[1:])
> +        return jobserver.run(sys.argv[1:])
>  
>  
>  if __name__ == "__main__":
> -    main()
> +    sys.exit(main())
> -- 
> 2.54.0

Good catch, thanks!

For kbuild:
Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

