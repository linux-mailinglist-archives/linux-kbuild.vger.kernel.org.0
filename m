Return-Path: <linux-kbuild+bounces-10944-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDUqG1RSfGmwLwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10944-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 07:40:20 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F66B7A8D
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 07:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6255630058DA
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 06:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB9C338585;
	Fri, 30 Jan 2026 06:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7PHlYEN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585443314AE;
	Fri, 30 Jan 2026 06:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769755216; cv=none; b=DGdyTejQwuRsay/zY4bxInxfFCKXkzEXaq3/8Lyy95iv5oXftEqdAN01C8+TrhHvOdLYrHkCXXeUop8m7RPjDR7YWeICiDgjFAA0U5Bc2mgEKM0Jvt1BG8Lutq5LS3v89UCerIqIaorJykXc0RElnwa4EU/G0HoTNvkgLgzZG/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769755216; c=relaxed/simple;
	bh=qIBxrF2hQmN7WONWgAkCwa6bOclIF+BsQ/T1XUzy/FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U52hKdDKT2luaDpYCw0PKDK1ZJpPN9UycVGQKExDA67RvmWiUlmnOrjITwq6NHrz1fp6OeUY02jONu6hESaDfja+TXU0RwBtUzneVMM+pOaYZ4h9xp2onIQ314kFyaszS0PozhHhZrXn5aimisdSoTlT8AtrwYGurzX4J6O5ycY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7PHlYEN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1885DC4CEF7;
	Fri, 30 Jan 2026 06:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769755215;
	bh=qIBxrF2hQmN7WONWgAkCwa6bOclIF+BsQ/T1XUzy/FI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7PHlYENvYWORUmNGPJNjRFLIMblo9mgBUy9OD8bfHp9uEnW2kw/TvyUv3Ykp3Mmg
	 dwCkd2BX6KBOysydDfTrEK6WeCpm8OdWM1QLrhMT37uDpexFCIJ0tL64FC4I2dRbe/
	 vN5eBsB72SA/L3L/l+epZ6Zo51GoZGfO/SgxMXiesjea7bmwl40H7SwkcIdifwNU/y
	 2Loa5+R8E0WMpaSghSRx6GWSkLk72+GdgcefY9oEDOzAVkviGSdNYigjPgVa4QxQWj
	 458GmEyKw/6My1h5epbWc+nyLRDQ8LR5uuZeTnrDFWFYnBtKpabtGTEqTzvq+AVwpO
	 OOjPeLnggYMqQ==
Date: Thu, 29 Jan 2026 23:40:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Rong Zhang <i@rong.moe>, Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] kbuild: install-extmod-build: Add missing python
 libraries
Message-ID: <20260130064011.GA2981809@ax162>
References: <20260129175321.415295-1-i@rong.moe>
 <20260130011106.GA359714@ax162>
 <20260130063056.72fbe458@foz.lan>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130063056.72fbe458@foz.lan>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10944-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,huawei];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 11F66B7A8D
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 06:30:56AM +0100, Mauro Carvalho Chehab wrote:
> On Thu, 29 Jan 2026 18:11:06 -0700
> Nathan Chancellor <nathan@kernel.org> wrote:
> > On Fri, Jan 30, 2026 at 01:49:55AM +0800, Rong Zhang wrote:
...
> > >   $ make -C /lib/modules/6.19.0-rc6/build/ M="$(pwd)" modules V=1 W=1
> > >   [...]
> > >   make -f /usr/src/linux-headers-6.19.0-rc6/scripts/Makefile.build obj=. need-builtin=1 need-modorder=1
> > >   # CC [M]  mod.o
> > >   [...]
> > >   # cmd_checkdoc mod.o
> > >   PYTHONDONTWRITEBYTECODE=1 python3 /usr/src/linux-headers-6.19.0-rc6/scripts/kernel-doc.py -none mod.c
> 
> This sounds really weird, as it is trying to run scripts/kernel-doc.py
> instead of tools/docs/kernel-doc. Does the out-of-tree Makefile
> override KERNELDOC variable? The current version contains:
> 	
> 	KERNELDOC       = $(srctree)/tools/docs/kernel-doc
> 
> But somehow it is using the old version before the renames:
> 
> 	KERNELDOC       = $(srctree)/scripts/kernel-doc.py

Well I think based on the "6.19.0-rc6" in the path above, this is
mainline, not -next, so the rename has has not happend there yet.

> Btw, I did a very quick test here, using an old OOT project I have
> at github:
> 
> 	https://github.com/mchehab/xr_serial
...
> It sounds to me that Rong may be using a Makefile on his OOT project
> that was not updated to pick the right kernel-doc tool.

If I use that project with Rong's original command, the
linux-upstream-headers package from the pacman-pkg target (which uses
install-extmod-build), and the following fix up for a more modern kernel
version, I see the following error:

  $ make -C /usr/lib/modules/6.19.0-rc7-next-20260129/build M=/tmp/xr_serial modules V=1 W=1
  ...
  # CC [M]  xr_serial.o
    gcc ...
  # cmd_checkdoc xr_serial.o
    PYTHONDONTWRITEBYTECODE=1 python3 /usr/lib/modules/6.19.0-rc7-next-20260129/build/tools/docs/kernel-doc -none   xr_serial.c
  python3: can't open file '/usr/lib/modules/6.19.0-rc7-next-20260129/build/tools/docs/kernel-doc': [Errno 2] No such file or directory
  make[3]: *** [/usr/lib/modules/6.19.0-rc7-next-20260129/build/scripts/Makefile.build:287: xr_serial.o] Error 2

If it is not expected that kernel-doc runs for external modules, then
maybe cmd_checkdoc should also be wrapped in a check for KBUILD_EXTMOD?

Cheers,
Nathan

diff --git a/xr_serial.c b/xr_serial.c
index 63a45a2..d4f7d81 100644
--- a/xr_serial.c
+++ b/xr_serial.c
@@ -517,7 +517,7 @@ static void xr_dtr_rts(struct usb_serial_port *port, int on)
 		xr_tiocmset_port(port, 0, TIOCM_DTR | TIOCM_RTS);
 }
 
-static void xr_break_ctl(struct tty_struct *tty, int break_state)
+static int xr_break_ctl(struct tty_struct *tty, int break_state)
 {
 	struct usb_serial_port *port = tty->driver_data;
 	struct xr_port_private *port_priv = usb_get_serial_data(port->serial);
@@ -526,7 +526,7 @@ static void xr_break_ctl(struct tty_struct *tty, int break_state)
 	if (port_priv->model != XR21V141X) {
 		xr_usb_serial_ctrl_msg(port, USB_CDC_REQ_SEND_BREAK, state,
 				       NULL, 0);
-		return;
+		return 0;
 	}
 
 	if (break_state == 0)
@@ -538,6 +538,7 @@ static void xr_break_ctl(struct tty_struct *tty, int break_state)
 		state == UART_BREAK_OFF ? "off" : "on");
 	xr_set_reg_uart(port, xr_hal_table[port_priv->model][REG_TX_BREAK],
 			state);
+	return 0;
 }
 
 /* Tx and Rx clock mask values obtained from section 3.3.4 of datasheet */
@@ -645,7 +646,7 @@ static int xr_set_baudrate(struct tty_struct *tty,
 
 static void xr_set_flow_mode(struct tty_struct *tty,
 			     struct usb_serial_port *port,
-			     struct ktermios *old_termios)
+			     const struct ktermios *old_termios)
 {
 	struct xr_port_private *port_priv = usb_get_serial_data(port->serial);
 	u8 flow, gpio_mode;
@@ -701,7 +702,7 @@ static void xr_set_flow_mode(struct tty_struct *tty,
 
 static void xr_set_termios_cdc(struct tty_struct *tty,
 			       struct usb_serial_port *port,
-			       struct ktermios *old_termios)
+			       const struct ktermios *old_termios)
 {
 	struct ktermios *termios = &tty->termios;
 	struct usb_cdc_line_coding line = { 0 };
@@ -747,7 +748,7 @@ static void xr_set_termios_cdc(struct tty_struct *tty,
 
 static void xr_set_termios_format_reg(struct tty_struct *tty,
 				      struct usb_serial_port *port,
-				      struct ktermios *old_termios)
+				      const struct ktermios *old_termios)
 {
 	struct xr_port_private *port_priv = usb_get_serial_data(port->serial);
 	struct ktermios *termios = &tty->termios;
@@ -805,7 +806,7 @@ static void xr_set_termios_format_reg(struct tty_struct *tty,
 
 static void xr_set_termios(struct tty_struct *tty,
 			   struct usb_serial_port *port,
-			   struct ktermios *old_termios)
+			   const struct ktermios *old_termios)
 {
 	struct xr_port_private *port_priv = usb_get_serial_data(port->serial);
 

