Return-Path: <linux-kbuild+bounces-4886-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F52E9DA030
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 02:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD5CF16892F
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 01:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A9628E8;
	Wed, 27 Nov 2024 01:08:36 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A878F5C;
	Wed, 27 Nov 2024 01:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732669716; cv=none; b=F0vzgAQf9NmWpTx2UdNjbjNK5qsD7QOD1P1lXFa/w4B2kOQWc+oPkUyr5Ta38SMKcivBMje8WxPfbgOZxoW4DnHy7XDel8AmqDKYJ8XIFRHmrLo/8KEBZGSH41mbzKFGfnLpK2ImRAJYerfr/I/qaHm38rg6oA6aSiAu+4Pd7vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732669716; c=relaxed/simple;
	bh=QLci+I7Hcbge8QfcwBcwZEGwMzhpA+c87e6vrbpgXDc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jB2DrAUUo3DVoQN0TPNbMxkFB1lq2XmxhUkKvb/q4Q0pP57i0yW0WPTuxdpA+evkAMUuBvb/7f0ArM7253WlwO4Le3Uz2PlB4aylQ01awweR4GxOJ6+y7gx/6vZ/CwKENvwzqfu6RL+yqk1PdXF7wYpV6QdZgzb2GlKWF2V6HSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D1BC4CECF;
	Wed, 27 Nov 2024 01:08:35 +0000 (UTC)
Date: Tue, 26 Nov 2024 20:09:25 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: David Hunter <david.hunter.linux@gmail.com>
Cc: masahiroy@kernel.org, javier.carrasco.cruz@gmail.com,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org
Subject: Re: [PATCH v2 2/7] streamline_config.pl: ensure all defaults are
 tracked
Message-ID: <20241126200925.442af060@gandalf.local.home>
In-Reply-To: <20241126234813.1602902-1-david.hunter.linux@gmail.com>
References: <CAK7LNAR8TQx=r-esfi+dJ3=TQ+6Om+LPadhDPqn3TLH93xi4WQ@mail.gmail.com>
	<20241126234813.1602902-1-david.hunter.linux@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 26 Nov 2024 18:48:13 -0500
David Hunter <david.hunter.linux@gmail.com> wrote:

> From: david.hunter.linux@gmail.com
> 
> There are many instances of the second line of a config entry containing infomation about defaults. Here is a summary: 
> 
> def_bools found: 746
> def_tristates found: 59
> defaults found: 169
> 
> > Can you list some examples of where this happens?  
> 
> I created a file that finds all the times that a default information is given in the line following a CONFIG entry is created. Here is a link for the output, which will show the file and the line numbers: 
> 
> https://github.com/dshunter107/linux-tools/blob/main/localmodconfig/defaults.output
> 
> If you would like to see the shell script I made to find the locations, you can view it at this link: 
> 
> https://github.com/dshunter107/linux-tools/blob/main/localmodconfig/check_define.sh
> 

Thanks, can you ping me again next week. I'm still finishing up this merge
window and have a lot of tasks that need to get done before Thanksgiving,
and will be taking a break from computing during the Holiday.

I'm not going to have time to look at this this week, and will likely
forget about it.

-- Steve

