Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5A12C1800
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 22:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731876AbgKWVvq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 16:51:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731686AbgKWVvq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 16:51:46 -0500
Received: from eggs.gnu.org (eggs.gnu.org [IPv6:2001:470:142:3::10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09788C0613CF;
        Mon, 23 Nov 2020 13:51:46 -0800 (PST)
Received: from fencepost.gnu.org ([2001:470:142:3::e]:56296)
        by eggs.gnu.org with esmtp (Exim 4.90_1)
        (envelope-from <ebrahim@gnu.org>)
        id 1khJkO-00082X-1f; Mon, 23 Nov 2020 16:51:44 -0500
Received: from ebrahim by fencepost.gnu.org with local (Exim 4.82)
        (envelope-from <ebrahim@gnu.org>)
        id 1khJkN-0005sj-It; Mon, 23 Nov 2020 16:51:43 -0500
Date:   Mon, 23 Nov 2020 16:51:43 -0500
From:   Ebrahim Byagowi <ebrahim@gnu.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gconfig: avoid use of hard coded colors for rows
Message-ID: <20201123215143.GA21824@gnu.org>
References: <20201123213314.GA25149@gnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123213314.GA25149@gnu.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Not an important thing of course just that I was unable to
use gconfig on my system with a theme dark is set like [1]
and this turns it into [2] without noticable change to the
light theme.

I had hit this minor issue also in the past but decided to
fix it this time.

This isn't the best possible approach as now we have we have
a GdkColor -> gchar * -> GdkColor round trip, yet wanted to
keep the change small and maybe go for a larger change later
if it worths it.

Hope you find it useful also.

  [1]: https://i.imgur.com/MJfIkup.png
  [2]: https://i.imgur.com/lgvod9V.png
